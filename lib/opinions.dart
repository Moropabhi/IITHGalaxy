import 'dart:core';
import 'package:flutter/material.dart';
import 'package:iithgalaxy/view_widget.dart';
import 'navdrawer.dart';
import 'myPage.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


String wrapUp(String s, int n)
{
  return s.length>n?"${s.substring(0,n)}...":s;
}

enum OpinionType{
  others,reviews,compliants,petitions
}

  String getstr(OpinionType x)
  {
    switch (x) {
      case OpinionType.others:
        return "Others";
      case OpinionType.reviews :return "Reviews";
      case OpinionType.compliants :return "Compliants";
      case OpinionType.petitions :return "Petitions";
      default:return "";
    }
  }
var strOpinion = OpinionType.values.map((x){return getstr(x);}).toList();

class Opinion extends DataView{
  String name;
  OpinionType type;
  String authorDetails;
  String detail;

  Opinion({
    required this.name,
    required this.type,
    required this.authorDetails,
    required this.detail,
  });


  factory Opinion.fromMap(Map<String, dynamic> data) {
    final name = (data['name'] ?? '').toString();
    final typeStr = (data['type'] ?? '').toString().toLowerCase();
    final author = (data['authorDetails'] ?? data['author'] ?? '').toString();
    final detail = (data['detail'] ?? '').toString();

    OpinionType type = OpinionType.others;
    if (typeStr == 'reviews') type = OpinionType.reviews;
    else if (typeStr == 'compliants' || typeStr == 'complaints') type = OpinionType.compliants;
    else if (typeStr == 'petitions') type = OpinionType.petitions;

    return Opinion(
      name: name.isEmpty ? 'Untitled' : name,
      type: type,
      authorDetails: author.isEmpty ? 'Unknown' : author,
      detail: detail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type.toString().split('.').last,
      'authorDetails': authorDetails,
      'detail': detail,
      'createdAt': FieldValue.serverTimestamp(), // requires cloud_firestore import
    };
  }

  @override
  String toString() {
    return "$type $name by $authorDetails";
  }
  
  @override
  String getAuthor() {
    return authorDetails;
  }
  
  @override
  String getDesc() {
    return detail;
  }
  
  @override
  String getName() {
    return name;
  }
  
  @override
  String? getTime() {
    return null;
  }
    @override
  void setAuthor(String s) {
    authorDetails=s;
  }
  
  @override
  void setDesc(String s) {
    detail=s;
  }
  
  @override
  void setName(String s) {
    name=s;
  }
  
  @override
  void setTime(DateTime s, DateTime e) {
    // start=s;
    // duration=e.difference(s);
  }
  
  @override
  String getType() {
    return strOpinion[type.index];
  }
  
  @override
  void setType(int i) {
    type=OpinionType.values[i];
  }
}

class Opinions {
  static List<Opinion> items = [];

  static final CollectionReference _opinionsCol = FirebaseFirestore.instance.collection('Opinions');

  static StreamSubscription<QuerySnapshot>? _opinionsSub;

  Opinions();

  Iterable<String> getList() {
    return items.map<String>((t) {
      return t.toString();
    });
  }

  

  List<Widget> getListCard(BuildContext context) {
    return items.map<Widget>((x) {
      return TextButton(
        onPressed: () {
          NavDrawer.setThePage(context,  MaterialPageRoute<void>(builder: (context){return MyPage(body:  ViewWidget(v:x));}));
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              clipBehavior: Clip.hardEdge,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      getstr(x.type),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        ),
                    ),
                    Text(
                      "${wrapUp(x.name,30)} \nby ${wrapUp(x.authorDetails,30)}",
                    ),
                    Text(
                      wrapUp(x.detail,300),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  // void fetchData() {
  //   items = [
  //     Opinion(name: "Robotoic Arm"*8, type: OpinionType.petitions, authorDetails: "Me and others"*90, detail: "we made this arm."*90),
  //     Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
  //     Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
  //     Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
  //     Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
  //     Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
  //     Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
  //     Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
      
  //   ];
  // }

  static void listenToOpinions({String orderByField = 'createdAt', bool descending = true}) {
    _opinionsSub?.cancel();

    Query query = _opinionsCol;
    if (orderByField.isNotEmpty) {
      query = query.orderBy(orderByField, descending: descending);
    }

    _opinionsSub = query.snapshots().listen((snapshot) {
      try {
        items = snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Opinion.fromMap(data);
        }).toList();
      } catch (e) {
        print('listenToOpinions parsing error: $e');
        items = [];
      }
      
    }, onError: (err) {
      print('listenToOpinions error: $err');
    });
  }

  /// Cancel the realtime listener (call in dispose()).
  static void cancelListener() {
    _opinionsSub?.cancel();
    _opinionsSub = null;
  }

  static Future<DocumentReference> addOpinion(Opinion op) async {
    try {
      final docRef = await _opinionsCol.add(op.toMap());
      return docRef;
    } catch (ex) {
      print('addOpinion error: $ex');
      rethrow;
    }
  }
}
