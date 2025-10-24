import 'dart:core';
import 'package:flutter/material.dart';
import 'package:iithgalaxy/view_widget.dart';
import 'navdrawer.dart';
import 'myPage.dart';

String wrapUp(String s, int n)
{
  return s.length>n?"${s.substring(0,n)}...":s;
}

enum OpinionType{
  others,reviews,compliants,petitions
}

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

  @override
  String toString() {
    return "$type $name by $authorDetails";
  }
  
  @override
  String getAuthor() {
    return this.authorDetails;
  }
  
  @override
  String getDesc() {
    return this.detail;
  }
  
  @override
  String getName() {
    return this.name;
  }
  
  @override
  String? getTime() {
    return null;
  }
}

class Opinions {
  List<Opinion> items = [];

  Opinions({this.items = const <Opinion>[]});

  Iterable<String> getList() {
    return items.map<String>((t) {
      return t.toString();
    });
  }

  String getstr(OpinionType x)
  {
    switch (x) {
      case OpinionType.others:
        return "Others";
      case OpinionType.reviews :return "Reviews";
      case OpinionType.compliants :return "Compliants";
      case OpinionType.petitions :return "Petitions";
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

  void fetchData() {
    items = [
      Opinion(name: "Robotoic Arm"*8, type: OpinionType.petitions, authorDetails: "Me and others"*90, detail: "we made this arm."*90),
      Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
      Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
      Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
      Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
      Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
      Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
      Opinion(name: "Robotoic Arm", type: OpinionType.petitions, authorDetails: "Me and others", detail: "we made this arm."),
      
    ];
  }
}
