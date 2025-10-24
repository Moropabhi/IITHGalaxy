import 'package:flutter/material.dart';
import 'package:iithgalaxy/iithspecials_widget.dart';
import 'home_body.dart';
import 'calendar_widget.dart';

var icon = "assets/bitmap.png";
var weather = "assets/weather.jpg";
var jotdown = "assets/notepad.png";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IITHGalaxy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
        leading: FloatingActionButton(
          clipBehavior: Clip.hardEdge,
          isExtended: true,
          onPressed: () {},
          backgroundColor: const Color.fromARGB(255, 32, 32, 32),
          splashColor: Colors.black,
          hoverColor: Colors.black,
          child: Image.asset(icon),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      ),

      body: const HomeBody(),
      //body:IITHSpecialWidget(),
      backgroundColor: Colors.black,
    );
  }
}
