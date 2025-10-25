import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'view_widget.dart';
import 'navdrawer.dart';
import 'myPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


String wrapUp(String s, int n)
{
  return s.length>n?"${s.substring(0,n)}...":s;
}

enum ItemType{
  others,papers,projects,ideas,researchUpdates
}

class Item extends DataView{
  String name;
  ItemType type;
  String authorDetails;
  String detail;

  Item({
    required this.name,
    required this.type,
    required this.authorDetails,
    required this.detail,
  });

  factory Item.fromMap(Map<String, dynamic> data) {
    final name = (data['name'] ?? '').toString();
    final typeStr = (data['type'] ?? '').toString().toLowerCase();
    final author = (data['authorDetails'] ?? data['author'] ?? '').toString();
    final detail = (data['detail'] ?? '').toString();

    ItemType type = ItemType.others;
    if (typeStr == 'projects') type = ItemType.projects;
    else if (typeStr == 'papers') type = ItemType.papers;
    else if (typeStr == 'ideas') type = ItemType.ideas;
    else if (typeStr == 'researchupdates' || typeStr == 'research' || typeStr == 'research_logs')
      type = ItemType.researchUpdates;

    return Item(
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
}

class IITHSpecial {
  List<Item> items = [];

    // Firestore collection for IITHSpecial items
  final CollectionReference _itemsCol = FirebaseFirestore.instance.collection('IITHSpecial');

  // Realtime subscription
  StreamSubscription<QuerySnapshot>? _itemsSub;


  IITHSpecial({this.items = const <Item>[]});

  Iterable<String> getList() {
    return items.map<String>((t) {
      return t.toString();
    });
  }

  String getstr(ItemType x)
  {
    switch (x) {
      case ItemType.others:
        return "Others";
      case ItemType.papers :return "Papers";
      case ItemType.projects :return "Projects";
      case ItemType.ideas :return "Ideas";
      case ItemType.researchUpdates :return "Research Logs";
    }
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
              color: const Color.fromARGB(255, 58, 58, 58),
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
                        color: const Color.fromARGB(255, 0, 47, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        ),
                    ),
                    Text(
                      "${wrapUp(x.name,30)} \nby ${wrapUp(x.authorDetails,30)}",
                      style: TextStyle(color: const Color.fromARGB(255, 255, 188, 188)),
                    ),
                    Text(
                      wrapUp(x.detail,300),
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: const Color.fromARGB(255, 255, 188, 188)),
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
List<Widget> getsmallListCard(BuildContext context) {
    return items.map<Widget>((x) {
      int max = 15;
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
              color: const Color.fromARGB(255, 58, 58, 58),
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
                        color: const Color.fromARGB(255, 0, 47, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        ),
                    ),
                    Text(
                      "${wrapUp(x.name,20)} \tby ${wrapUp(x.authorDetails,20)}",
                      style: TextStyle(color: const Color.fromARGB(255, 255, 188, 188)),
                    ),
                    Text(
                      wrapUp(x.detail,20),
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: const Color.fromARGB(255, 255, 188, 188)),
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
  //     Item(name: "Robotoic Arm"*8, type: ItemType.projects, authorDetails: "Me and others"*90, detail: "we made this arm."*90),
  //     Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
  //     Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
  //     Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
  //     Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
  //     Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
  //     Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
  //     Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
      
  //   ];
  // }

    
  void listenToItems({String orderByField = 'createdAt', bool descending = true}) {
    // cancel any existing subscription
    _itemsSub?.cancel();

    Query query = _itemsCol;
    if (orderByField.isNotEmpty) {
      query = query.orderBy(orderByField, descending: descending);
    }

    _itemsSub = query.snapshots().listen((snapshot) {
      try {
        items = snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Item.fromMap(data);
        }).toList();
      } catch (e) {
        print('listenToItems parsing error: $e');
        items = [];
      }
    }, onError: (err) {
      print('listenToItems error: $err');
    });
  }

  /// Cancel the realtime listener (call this in dispose()).
  void cancelListener() {
    _itemsSub?.cancel();
    _itemsSub = null;
  }


  Future<DocumentReference> addItem(Item it) async {
    try {
      final docRef = await _itemsCol.add(it.toMap());
      return docRef;
    } catch (ex) {
      print('addItem error: $ex');
      rethrow;
    }
  }

}
