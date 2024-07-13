// Written by Juan Pablo Gutiérrez
// 04 - 07 - 2023

import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final Gradient gradient;
  final Widget body;
  final bool isCentered;
  final bool isInSafeArea;
  final Widget? drawer;
  final EdgeInsetsGeometry padding;

  const GradientScaffold({
    required this.gradient,
    required this.body,
    required this.isCentered,
    required this.isInSafeArea,
    required this.padding,
    this.drawer,
    super.key,
  });

  Widget getBody() {
    return Padding(padding: padding, child: body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: drawer,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: gradient),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          isCentered
              ? Center(
                  child: isInSafeArea ? SafeArea(child: getBody()) : getBody(),
                )
              : isInSafeArea
                  ? SafeArea(child: getBody())
                  : getBody(),
        ],
      ),
    );
  }
}
