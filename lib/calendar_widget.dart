import 'package:flutter/material.dart';
import 'package:iithgalaxy/navdrawer.dart';
import 'calender.dart';
import 'myPage.dart';

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
          Text(
                "Events",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
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
            onPressed: () {

              NavDrawer.setThePage(context,  MaterialPageRoute<void>(builder: (context){return MyPage(body:  CalenderWidget());}));
            },
            clipBehavior: Clip.hardEdge,
            
            child: Text("Events", textAlign: TextAlign.center),
          ),
        ]+l,
      ),
    );
  }
}
