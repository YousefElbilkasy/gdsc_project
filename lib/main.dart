import 'package:flutter/material.dart';
import 'package:gdsc_project/home_page.dart';
import 'package:gdsc_project/location.dart';
import 'package:gdsc_project/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome',
      routes: {
        'welcome': (context) => const WelcomePage(),
        'home': (context) => const HomePage(),
        'location': (context) => const Location(),
      },
      theme: ThemeData(
          fontFamily: 'Roboto', backgroundColor: const Color(0x00504f53)),
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
