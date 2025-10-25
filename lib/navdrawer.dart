import 'package:flutter/material.dart';
import 'package:iithgalaxy/iithspecials_widget.dart';
import 'myPage.dart';
import 'home_body.dart';
import 'calendar_widget.dart';
import 'opinions_widget.dart';

int current= -1;
class NavDrawer extends StatelessWidget {
  NavDrawer({super.key});
  final textstyle = const TextStyle(color: Colors.white);
  static final entries = <String>[
    "Home",
    "Calendar",
    "IITHSpecials",
    "Opinion.IITH",
  ];
  final methods = [
    (){return MaterialPageRoute<void>(builder: (context){return MyPage(body:  HomeBody());});},
    (){return MaterialPageRoute<void>(builder: (context){return MyPage(body:  CalenderWidget());});},
    (){return MaterialPageRoute<void>(builder: (context){return MyPage(body:  IITHSpecialWidget());});},
    (){return MaterialPageRoute<void>(builder: (context){return MyPage(body:  OpinionsWidget());});},
  ];

  static void setThePage(BuildContext context,MaterialPageRoute<void> route,)
  {
                  
                  Navigator.pop(context);
                  Navigator.push(context, route);
                  current=-1;
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 24, 22, 22),
      child: ListView(
        children:
            <Widget>[
              SizedBox(
                height: 100,
                child: TextButton(onPressed: () {}, child: Text("Hello User (To be implemented)")),
              ),
            ] +
            List.generate(entries.length, (i) {
              return TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if(current==i)return;
                  Navigator.pop(context);
                  Navigator.push(context, methods[i]());
                  current = i;
                },
                child: Text(entries[i], style: textstyle),
              );
            }),
      ),
    );
  }
}
