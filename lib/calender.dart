import 'dart:core';
import 'package:flutter/material.dart';

class Event {
  String name;
  DateTime start;
  Duration duration;
  String? detail;

  Event({
    required this.name,
    required this.duration,
    required this.start,
    this.detail,
  });

  @override
  String toString() {
    return "${start.day}/${start.month}/${start.year} $name ${duration.inDays == 0 ? "" : (duration.inDays == 1 ? "${duration.inDays} day" : "${duration.inDays} days")} ${duration.inHours == 0 ? "" : (duration.inHours == 1 ? "${duration.inHours} hour" : "${duration.inHours} hours")} ${duration.inMinutes == 0 ? "" : "${duration.inMinutes} minutes"} ${detail ?? ""} ";
  }
}

class Calender {
  List<Event> event = [];

  Calender({this.event = const <Event>[]});

  Iterable<String> getList() {
    return event.map<String>((t) {
      return t.toString();
    });
  }

  List<Widget> getListCard() {
    return event.map<Widget>((x) {
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
                "${x.start.day}/${x.start.month}/${x.start.year}",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 47, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  ),
              ),
              Flexible(
                child: Text(
                  x.name,
                  style: TextStyle(color: const Color.fromARGB(255, 255, 188, 188)),
                ),
              ),
              Text(
                "${x.duration.inDays == 0 ? "" : (x.duration.inDays == 1 ? "${x.duration.inDays} day" : "${x.duration.inDays} days")} ${x.duration.inHours == 0 ? "" : (x.duration.inHours == 1 ? "${x.duration.inHours} hour\n" : "${x.duration.inHours} hours\n")} ${x.duration.inMinutes == 0 ? "" : "${x.duration.inMinutes} minutes"} ",
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
    return event.map<Widget>((x) {
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
                "${x.start.day}/${x.start.month}/${x.start.year}\n${x.duration.inDays == 0 ? "" : (x.duration.inDays == 1 ? "${x.duration.inDays} day" : "${x.duration.inDays} days")} ${x.duration.inHours == 0 ? "" : (x.duration.inHours == 1 ? "${x.duration.inHours} hour\n" : "${x.duration.inHours} hours\n")} ${x.duration.inMinutes == 0 ? "" : "${x.duration.inMinutes} minutes"} ",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 47, 255),
                  fontWeight: FontWeight.bold,
                  ),
              ),
              Flexible(
                child: Text(
                  (x.name.length>max?"${x.name.substring(0,max)}...":x.name),
                  style: TextStyle(color: const Color.fromARGB(255, 255, 188, 188)),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  void fetchData() {
    event = [
      Event(
        name: "Event1",
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),
      ),
      Event(
        name: "Event1"*90,
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),
      ),
      Event(
        name: "Event1",
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),
      ),
      Event(
        name: "Event1",
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),
      ),
      Event(
        name: "Event1",
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),
      ),
      Event(
        name: "Event1",
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),
      ),
      
    ];
  }
}
