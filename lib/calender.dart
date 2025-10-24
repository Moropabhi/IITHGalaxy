import 'dart:core';
import 'package:flutter/material.dart';
import 'package:iithgalaxy/view_widget.dart';
import 'navdrawer.dart';
import 'myPage.dart';

class Event extends DataView{
  String name;
  String authorDetails;
  DateTime start;
  Duration duration;
  String? detail;

  Event ({
    required this.name,
    required this.duration,
    required this.start,
    required this.authorDetails,
    this.detail,
  });

  @override
  String toString() {
    return "${start.day}/${start.month}/${start.year} $name ${duration.inDays == 0 ? "" : (duration.inDays == 1 ? "${duration.inDays} day" : "${duration.inDays} days")} ${duration.inHours == 0 ? "" : (duration.inHours == 1 ? "${duration.inHours} hour" : "${duration.inHours} hours")} ${duration.inMinutes == 0 ? "" : "${duration.inMinutes} minutes"} ${detail ?? ""} ";
  }
  
    @override
  String getAuthor() {
    return authorDetails;
  }
  
  @override
  String getDesc() {
    return detail??"";
  }
  
  @override
  String getName() {
    return name;
  }
  
  @override
  String? getTime() {
    return "${start.day}/${start.month}/${start.year} \n${start.hour == 0 ? "" : (start.hour == 1 ? "${start.hour} hour" : "${start.hour}")}:${start.minute == 0 ? "" : "${start.minute}"}\n${duration.inDays == 0 ? "" : (duration.inDays == 1 ? "${duration.inDays} day" : "${duration.inDays} days")} ${duration.inHours == 0 ? "" : (duration.inHours == 1 ? "${duration.inHours} hour" : "${duration.inHours} hours")} ${duration.inMinutes == 0 ? "" : "${duration.inMinutes} minutes"}";
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

  List<Widget> getListCard(BuildContext context) {
    return event.map<Widget>((x) {
      return TextButton(
        onPressed:() {
                    NavDrawer.setThePage(context,  MaterialPageRoute<void>(builder: (context){return MyPage(body:  ViewWidget(v:x));}));
        } ,
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
                    Text(
                      x.name,
                      style: TextStyle(color: const Color.fromARGB(255, 255, 188, 188)),
                    ),
                    Text(
                      x.getTime()??'',
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
    return event.map<Widget>((x) {
      int max = 30;
      return TextButton(
        onPressed: () {
                    NavDrawer.setThePage(context,  MaterialPageRoute<void>(builder: (context){return MyPage(body:  ViewWidget(v:x));}));
          
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              color: const Color.fromARGB(255, 58, 58, 58),
              clipBehavior: Clip.hardEdge,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  spacing: 10,
                  children: [
                    Text(
                      x.getTime()??'',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 47, 255),
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    Text(
                      (x.name.length>max?"${x.name.substring(0,max)}...":x.name),
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
    event = [
      Event(
        name: "Event1"*90,
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),authorDetails:"hike"
      ),
      Event(
        name: "Event1"*90,
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),authorDetails:"hike"
      ),
      Event(
        name: "Event1"*90,
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),authorDetails:"hike"
      ),
      Event(
        name: "Event1",
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),authorDetails:"hike"
      ),
      Event(
        name: "Event1",
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),authorDetails:"hike"
      ),
      Event(
        name: "Event1",
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),authorDetails:"hike"
      ),
      
    ];
  }

}
