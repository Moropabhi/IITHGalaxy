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
      return SizedBox(
        height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2,
        child: TextButton(onPressed: (){},child: Text("Jot Down",
        style: TextStyle(
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),
        ),
        
        )
        );
  }
}