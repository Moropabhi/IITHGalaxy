import 'package:flutter/material.dart';
import 'home_body.dart';
import 'myPage.dart';
import 'edit_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'theme/theme.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {  
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IITHGalaxy',
      theme: SpectralTheme.lightTheme,
      darkTheme: SpectralTheme.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const MyPage(body: HomeBody()),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 0, 0)),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: const Color.fromARGB(255, 162, 0, 255),
          ),
          bodyMedium: TextStyle(
            color: const Color.fromARGB(255, 255, 0, 0),
          ),bodySmall: TextStyle(
            color: const Color.fromARGB(255, 132, 0, 255),
          ),
        ),
      ),
      home: MyPage(body: HomeBody(),),
    );
  }
}

