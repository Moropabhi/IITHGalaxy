import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iithgalaxy/view_widget.dart';
import 'navdrawer.dart';
import 'myPage.dart';

enum EventType
{
  Lectures,Seminar,Sessions,Others
}

var strEvent = ["Lectures","Seminar","Sessions","Others"];

class Event extends DataView{
  String name;
  String authorDetails;
  EventType type;
  DateTime start;
  Duration duration;
  String? detail;

  Event ({
    required this.name,
    required this.duration,
    required this.start,
    this.type = EventType.Lectures,
    required this.authorDetails,
    this.detail,
  });

  @override
  String toString() {
    return "${start.day}/${start.month}/${start.year} $name ${duration.inDays == 0 ? "" : (duration.inDays == 1 ? "${duration.inDays} day" : "${duration.inDays} days")} ${duration.inHours == 0 ? "" : (duration.inHours-duration.inDays*24 == 1 ? "${duration.inHours-duration.inDays*24} hour" : "${duration.inHours} hours")} ${duration.inMinutes-duration.inHours*60 == 0 ? "" : "${duration.inMinutes-duration.inHours*60} minutes"} ${detail ?? ""} ";
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
    return "${start.day}/${start.month}/${start.year} \n${start.hour == 0 ? "" : (start.hour == 1 ? "${start.hour} hour" : "${start.hour}")}:${start.minute == 0 ? "" : "${start.minute}"}\n${duration.inDays == 0 ? "" : (duration.inDays == 1 ? "${duration.inDays} day" : "${duration.inDays} days")} ${duration.inHours-duration.inDays*24 == 0 ? "" : (duration.inHours-duration.inDays*24 == 1 ? "${duration.inHours} hour" : "${duration.inHours} hours")} ${duration.inMinutes-duration.inHours*60 == 0 ? "" : "${duration.inMinutes-duration.inHours*60} minutes"}";
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
    start=s;
    duration=e.difference(s);
  }
}

class Calender {
  static List<Event> event = [];

  Calender({this.event = const <Event>[]});

  final CollectionReference _eventsCol = FirebaseFirestore.instance.collection('Events');

  StreamSubscription<QuerySnapshot>? _eventsSub;

  Iterable<String> getList() {
    return event.map<String>((t) {
      return t.toString();
    });
  }

  List<Widget> getListCard(BuildContext context) {
    return event.map<Widget>((Event x) {
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
      
  //   ];
  // }

  void listenToEvents({bool orderByStart = true}) {
    // cancel previous subscription if any
    _eventsSub?.cancel();

    Query query = _eventsCol;
    if (orderByStart) {
      query = query.orderBy('start', descending: false);
    }

    _eventsSub = query.snapshots().listen((snapshot) {
      try {
        event = snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;

          final name = (data['name'] ?? data['Name'] ?? '').toString();
          final author = (data['authorDetails'] ?? data['author'] ?? '').toString();
          final detail = data['detail']?.toString();

          DateTime start;
          final s = data['start'];
          if (s is Timestamp) {
            start = s.toDate();
          } else if (s is int) {
            start = DateTime.fromMillisecondsSinceEpoch(s);
          } else if (s is String) {
            start = DateTime.tryParse(s) ?? DateTime.now();
          } else {
            start = DateTime.now();
          }

          Duration duration;
          if (data['durationMinutes'] != null) {
            final mins = int.tryParse(data['durationMinutes'].toString()) ?? 0;
            duration = Duration(minutes: mins);
          } else {
            final days = int.tryParse((data['duration_days'] ?? 0).toString()) ?? 0;
            final hours = int.tryParse((data['duration_hours'] ?? 0).toString()) ?? 0;
            final minutes = int.tryParse((data['duration_minutes'] ?? 0).toString()) ?? 0;
            duration = Duration(days: days, hours: hours, minutes: minutes);
          }

          return Event(
            name: name.isEmpty ? 'Unnamed Event' : name,
            authorDetails: author.isEmpty ? 'Unknown' : author,
            start: start,
            duration: duration,
            detail: detail,
          );
        }).toList();
      } catch (e) {
        print('listenToEvents parsing error: $e');
        event = [];
      }
      
    }, onError: (err) {
      print('listenToEvents error: $err');
    });
  }

  /// Stop listening (call from dispose)
  void cancelListener() {
    _eventsSub?.cancel();
    _eventsSub = null;
  }

  /// Realtime entering (write) to Firestore:
  /// addEvent writes an Event to the 'Events' collection.
  Future<void> addEvent(Event e) async {
    try {
      await _eventsCol.add({
        'name': e.name,
        'authorDetails': e.authorDetails,
        'detail': e.detail ?? '',
        'start': Timestamp.fromDate(e.start),
        'durationMinutes': e.duration.inMinutes,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (ex) {
      print('addEvent error: $ex');
      rethrow;
    }
  }
  static void addData(Event v)
  {
    Calender.event.add(v);
  }
}
