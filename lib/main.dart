import 'package:flutter/material.dart';
import 'home_body.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
      
      backgroundColor: Colors.black,
    );
  }
}

class Topbar extends AppBar {
  Topbar({super.key})
    : super(
        leading: Image.network(
          "https://imgs.search.brave.com/qolZCSaVxzhn2SeKeUwL8zS9qY6kXbOyLTgOmmCmXPk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/aWNvbmZpbmRlci5j/b20vZGF0YS9mYW1p/bHkvcHJldmlld3Mv/cHJldmlldy90ZWVu/eWljb25zLXNvbGlk/LnBuZz9pbmRleGVk/PTE3NDM1MjEyMjk",
        ),
      ) {}
  @override
  Widget build(BuildContext context) {
    return this;
  }
}
