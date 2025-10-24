import 'package:flutter/material.dart';
import 'package:iithgalaxy/iithspecials_widget.dart';
import 'package:iithgalaxy/navdrawer.dart';
import 'home_body.dart';
import 'calendar_widget.dart';
import 'myPage.dart';

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
      home: const MyPage(body: HomeBody(),),
    );
  }
}
