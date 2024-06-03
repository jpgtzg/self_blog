// Written by Juan Pablo Gutiérrez
//
// Started : 3 06 2024

import 'package:flutter/material.dart';
import 'package:self_blog/screen/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Self Blog',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
