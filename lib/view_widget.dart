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
  void setAuthor(String s);
  void setName(String s);
  void setTime(DateTime s, DateTime e);
  void setDesc(String s);
}

enum DataType{calenderType,iith_SpecialType,opinionsType}

class ViewWidget extends StatefulWidget {
  final DataView v;
  const ViewWidget({super.key,required this.v});

  @override
  State<ViewWidget> createState() => _ViewWidget(v);
}

class _ViewWidget extends State<ViewWidget> {
  final DataView v;
  _ViewWidget(this.v);
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children:
            <Widget>[
              Text(
                v.getName(),
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
                      " by ${v.getAuthor()} ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                    Flexible(
                      child: Text(
                      v.getTime()??"",
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
                v.getDesc(),
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