import 'package:flutter/material.dart';
import 'screens/camera_screen.dart';

void main() {
  runApp(const CameraApp());
}

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'F1 Zone Capture',
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xffb71c1c),
        scaffoldBackgroundColor: const Color(0xfff8f9fa),
      ),
      home: const CameraScreen(),
    );
  }
}