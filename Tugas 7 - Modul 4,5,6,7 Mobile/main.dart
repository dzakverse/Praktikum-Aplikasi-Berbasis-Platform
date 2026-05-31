import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const F1App());
}

class F1App extends StatelessWidget {
  const F1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'F1 ZONE',
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xffb71c1c),
        scaffoldBackgroundColor: const Color(0xfff8f9fa),
      ),
      home: const HomeScreen(), 
    );
  }
}