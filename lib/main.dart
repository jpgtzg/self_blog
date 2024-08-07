// Written by Juan Pablo Gutiérrez
//
// Started : 3 06 2024

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:self_blog/screen/home_screen.dart';
import 'package:self_blog/system/realm_manager.dart';

void main() {
  initRealm();

  runApp(const MainApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
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
