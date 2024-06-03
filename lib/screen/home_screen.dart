// Written by Juan Pablo Gutiérrez
// 3 06 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/widgets/gradient_scaffold.dart';
import 'package:self_blog/widgets/top_menu_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientScaffold(
      gradient: backGroundGradient,
      isCentered: true,
      isInSafeArea: true,
      body: Column(
        children: [
          TopMenuBar(),
        ],
      ),
    );
  }
}
