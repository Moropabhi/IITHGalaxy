import 'package:flutter/material.dart';
import 'package:iithgalaxy/opinions.dart';
import 'opinions.dart';
import 'navdrawer.dart';
import 'myPage.dart';

class OpinionsWidget extends StatefulWidget {
  const OpinionsWidget({super.key});

  @override
  State<OpinionsWidget> createState() => _OpinionsWidget();
}

class _OpinionsWidget extends State<OpinionsWidget> {
  @override
  Widget build(BuildContext context) {
    var c = Opinions();
    c.fetchData();

    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children:
            <Widget>[
              Text(
                "Opinions",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
            ] +
            c.getListCard(),
      ),
    );
  }
}