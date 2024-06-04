// Written by Juan Pablo Gutiérrez
//
// Started : 3 06 2024

import 'package:flutter/material.dart';
import 'package:self_blog/screen/home_screen.dart';
import 'package:self_blog/system/realm_manager.dart';
import 'package:self_blog/system/realm_models.dart';

void main() {
  initRealm();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Self Blog',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
