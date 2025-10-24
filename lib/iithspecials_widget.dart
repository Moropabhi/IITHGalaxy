import 'package:flutter/material.dart';
import 'iithspecials.dart';
import 'navdrawer.dart';
import 'myPage.dart';

class IITHSpecialWidget extends StatefulWidget {
  const IITHSpecialWidget({super.key});

  @override
  State<IITHSpecialWidget> createState() => _IITHSpecialWidget();
}

class _IITHSpecialWidget extends State<IITHSpecialWidget> {
  @override
  Widget build(BuildContext context) {
    var c = IITHSpecial();
    c.fetchData();

    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children:
            <Widget>[
              Text(
                "IITHSpecials",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
            ] +
            c.getListCard(context),
      ),
    );
  }
}

class IITHSpecialSmallWidget extends StatefulWidget {
  const IITHSpecialSmallWidget({super.key});

  @override
  State<IITHSpecialSmallWidget> createState() => _IITHSpecialSmallWidget();
}

class _IITHSpecialSmallWidget extends State<IITHSpecialSmallWidget> {
  @override
  Widget build(BuildContext context) {
    var c = IITHSpecial();
    c.fetchData();
    var l = c.getsmallListCard(context);
    int n = 2;
    if (l.length > n) {
      l = List.generate(n, (i) {
        return l[i];
      });
    }
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
            <Widget>[
              ElevatedButton(
                onPressed: () {
                  NavDrawer.setThePage(context,  MaterialPageRoute<void>(builder: (context){return MyPage(body:  IITHSpecialWidget());}));
                },
                clipBehavior: Clip.hardEdge,

                child: Text("Events", textAlign: TextAlign.center),
              ),
            ] +
            l,
      ),
    );
  }
}
