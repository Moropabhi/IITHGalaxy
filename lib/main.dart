import 'package:flutter/material.dart';


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
      appBar: AppBar(leading:FloatingActionButton(clipBehavior: Clip.hardEdge,
      isExtended: true,onPressed: (){},backgroundColor: const Color.fromARGB(255, 32, 32, 32),splashColor: Colors.black,hoverColor: Colors.black,child: Image.asset(icon),),backgroundColor: const Color.fromARGB(255, 32, 32, 32),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                  gradient: RadialGradient(radius:30.0,colors:  [Colors.black,Colors.blueAccent])
                ),
                    margin: EdgeInsets.all(0.0),
                child: Expanded(
                  child: ClipRRect(borderRadius: BorderRadiusGeometry.circular(20.0),child: Stack(alignment: AlignmentGeometry.center,children: [Image.asset(weather,fit: BoxFit.fill,height: MediaQuery.of(context).size.height/4,width: MediaQuery.of(context).size.width/2),Text("36C",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),)])),
                
                ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                  gradient: RadialGradient(radius:1,colors:  [Colors.blueAccent,Colors.black,])
                ),
                    //padding: EdgeInsets.all(100),
                    //color: Colors.amber,
                    child: Image.asset(jotdown,height: MediaQuery.of(context).size.height/4,width: MediaQuery.of(context).size.width/2),
                  ),
                ],
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Container(
                  //padding: EdgeInsets.all(50),
                      color: Colors.amber,
                      child: Text("hi"),
                ),
              ),
            ],
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 6,
            child: Container(
              //padding: EdgeInsets.all(100),
              color: const Color.fromARGB(255, 7, 73, 255),
              child: Image.network("https://imgs.search.brave.com/qolZCSaVxzhn2SeKeUwL8zS9qY6kXbOyLTgOmmCmXPk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/aWNvbmZpbmRlci5j/b20vZGF0YS9mYW1p/bHkvcHJldmlld3Mv/cHJldmlldy90ZWVu/eWljb25zLXNvbGlk/LnBuZz9pbmRleGVk/PTE3NDM1MjEyMjk"),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

class Topbar extends AppBar {
  Topbar({super.key}) : super(leading: Image.network("https://imgs.search.brave.com/qolZCSaVxzhn2SeKeUwL8zS9qY6kXbOyLTgOmmCmXPk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/aWNvbmZpbmRlci5j/b20vZGF0YS9mYW1p/bHkvcHJldmlld3Mv/cHJldmlldy90ZWVu/eWljb25zLXNvbGlk/LnBuZz9pbmRleGVk/PTE3NDM1MjEyMjk")) {}
  @override
  Widget build(BuildContext context) {
    return this;
  }
}
