import 'package:flutter/material.dart';
import 'navdrawer.dart';


var icon = "assets/bitmap.png";
var weather = "assets/weather.jpg";
var jotdown = "assets/notepad.png";

class MyPage extends StatefulWidget {
  final Widget body;

  const MyPage({super.key,required this.body});

  @override
  State<MyPage> createState() => _MyPageState(body);
}

class _MyPageState extends State<MyPage> {
  final Widget body;
  _MyPageState(this.body);
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
      builder: (context) {
        return IconButton(
          icon: Image.asset(icon),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),
        backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      ),

      body: body,
      drawer: NavDrawer(),
      //body:CalenderWidget(),
      backgroundColor: Colors.black,
    );
  }
}
