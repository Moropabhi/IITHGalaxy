import 'package:flutter/material.dart';
import 'home_body.dart';
import 'myPage.dart';
import 'edit_widget.dart';

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
      home: const MyPage(body: EditWidget(),),
    );
  }
}
