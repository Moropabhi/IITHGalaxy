import 'dart:core';
import 'package:flutter/material.dart';
import 'view_widget.dart';
import 'navdrawer.dart';
import 'myPage.dart';

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
}

class IITHSpecial {
  List<Item> items = [];

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

  void fetchData() {
    items = [
      Item(name: "Robotoic Arm"*8, type: ItemType.projects, authorDetails: "Me and others"*90, detail: "we made this arm."*90),
      Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
      Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
      Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
      Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
      Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
      Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
      Item(name: "Robotoic Arm", type: ItemType.projects, authorDetails: "Me and others", detail: "we made this arm."),
      
    ];
  }
}
