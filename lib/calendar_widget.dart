import 'package:flutter/material.dart';
import 'calender.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidget();
}

class _CalenderWidget extends State<CalenderWidget> {
  @override
  Widget build(BuildContext context) {
    var c = Calender();
    c.fetchData();

    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Text("Events", textAlign: TextAlign.center),
          ),
        ]+c.getListCard(),
      ),
    );
  }
}

class CalenderSmallWidget extends StatefulWidget {
  const CalenderSmallWidget({super.key});

  @override
  State<CalenderSmallWidget> createState() => _CalenderSmallWidget();
}

class _CalenderSmallWidget extends State<CalenderSmallWidget> {
  @override
  Widget build(BuildContext context) {
    var c = Calender();
    c.fetchData();
    var l = c.getsmallListCard();
    int n = 4;
    if(l.length>n)l=List.generate(n, (i){return l[i];});
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            clipBehavior: Clip.hardEdge,
            
            child: Text("Events", textAlign: TextAlign.center),
          ),
        ]+l,
      ),
    );
  }
}
