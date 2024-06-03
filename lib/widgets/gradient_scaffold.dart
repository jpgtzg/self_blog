// Written by Juan Pablo Gutiérrez
// 04 - 07 - 2023

import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final Gradient gradient;
  final Widget body;
  final bool isCentered;
  final bool isInSafeArea;

  const GradientScaffold({
    required this.gradient,
    required this.body,
    required this.isCentered,
    required this.isInSafeArea,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: gradient),
          ),
          isCentered
              ? Center(
                  child: isInSafeArea ? SafeArea(child: body) : body,
                )
              : isInSafeArea
                  ? SafeArea(child: body)
                  : body,
        ],
      ),
    );
  }
}
