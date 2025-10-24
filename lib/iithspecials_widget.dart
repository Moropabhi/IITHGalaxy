import 'package:flutter/material.dart';
import 'iithspecials.dart';

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
