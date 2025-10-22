import 'package:flutter/material.dart';

class JotDownWidget extends StatefulWidget{

  const JotDownWidget({super.key});

  @override
  State<JotDownWidget> createState() => _JotDownWidget();

}

class _JotDownWidget extends State<JotDownWidget>
{

  var jotdown = "assets/notepad.png";

  @override
  Widget build(BuildContext context) {
      return Container(
                      decoration: BoxDecoration(
                    gradient: RadialGradient(radius:1,colors:  [Colors.blueAccent,Colors.black,])
                  ),
                      //padding: EdgeInsets.all(100),
                      //color: Colors.amber,
                      child: Image.asset(jotdown,height: MediaQuery.of(context).size.height/4,width: MediaQuery.of(context).size.width/2),
                    );
  }
}