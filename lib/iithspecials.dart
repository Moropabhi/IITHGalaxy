import 'dart:core';
import 'package:flutter/material.dart';

enum ItemType{
  others,papers,projects,ideas,researchUpdates
}

class Item{
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

  List<Widget> getListCard() {
    return items.map<Widget>((x) {
      return Card(
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
              Flexible(
                child: Text(
                  "${x.name} by ${x.authorDetails}",
                  style: TextStyle(color: const Color.fromARGB(255, 255, 188, 188)),
                ),
              ),
              Text(
                x.detail.length>50?"${x.detail.substring(0,50)}...":x.detail,
                textAlign: TextAlign.justify,
                style: TextStyle(color: const Color.fromARGB(255, 255, 188, 188)),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
List<Widget> getsmallListCard() {
    return items.map<Widget>((x) {
      int max = 15;
      return Card(
        color: const Color.fromARGB(255, 58, 58, 58),
        clipBehavior: Clip.hardEdge,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
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
              Flexible(
                child: Text(
                  "${x.name} by ${x.authorDetails}",
                  style: TextStyle(color: const Color.fromARGB(255, 255, 188, 188)),
                ),
              ),
              Text(
                x.detail.length>20?"${x.detail.substring(0,20)}...":x.detail,
                textAlign: TextAlign.justify,
                style: TextStyle(color: const Color.fromARGB(255, 255, 188, 188)),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  void fetchData() {
    items = [
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
