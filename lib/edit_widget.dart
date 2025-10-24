import 'package:flutter/material.dart';
import 'package:iithgalaxy/opinions.dart';
import 'opinions.dart';
import 'navdrawer.dart';
import 'myPage.dart';
abstract class DataView{
  String getAuthor();
  String getName();
  String? getTime();
  String getDesc();
}

class EditWidget extends StatefulWidget {
  const EditWidget({super.key});

  @override
  State<EditWidget> createState() => _EditWidget();
}

class _EditWidget extends State<EditWidget> {
  _EditWidget();
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children:
            <Widget>[
              Text(
                "Editing Space",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      " by \${v.getAuthor()} ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                    Flexible(
                      child: Text(
                      "v.getTime()",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                ],
              ),
                Text(
                "v.getDesc()",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 50,),
            ] 
      ),
    );
  }
}