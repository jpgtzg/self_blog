// Written by  Juan Pablo Gutiérrez
// 09 07 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/widgets/back_bar.dart';
import 'package:self_blog/widgets/gradient_scaffold.dart';
import 'package:self_blog/widgets/standard_spacer.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return const GradientScaffold(
      gradient: backGroundGradient,
      isCentered: true,
      isInSafeArea: true,
      padding: EdgeInsets.only(left: 15.0, right: 15),
      body: Column(
        children: [
          BackBar(),
          StandardSpacer(
            value: standardSpacerHeight,
            direction: Direction.vertical,
          ),
        ],
      ),
    );
  }
}
