import 'package:flutter/material.dart';
import 'navdrawer.dart';
import 'edit_widget.dart';
import 'myPage.dart';

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
        child: TextButton(onPressed: (){
          NavDrawer.setThePage(context, MaterialPageRoute<void>(builder: (context){return MyPage(body:  EditWidget());}));
        },child: Text("Jot Down",
        style: TextStyle(
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),
        ),
        
        )
        );
  }
}