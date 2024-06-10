// Written by Juan Pablo Gutiérrez
// 3 06 2024

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/system/realm_models.dart';

class NoteCard extends StatelessWidget {
  final String titleText;
  final Widget widgetScreen;
  final Color primaryColor;
  final Color? secondaryColor;
  final Color buttonColor;
  final Note note;
  const NoteCard(
      {required this.titleText,
      required this.widgetScreen,
      required this.primaryColor,
      this.secondaryColor,
      required this.buttonColor,
      required this.note,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widgetScreen),
      ),
      child: AspectRatio(
        aspectRatio: 13 / 5,
        child: Container(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 25,
            left: 25,
            right: 25,
          ),
          decoration: (secondaryColor != null)
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      primaryColor,
                      secondaryColor!,
                    ],
                  ),
                )
              : BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  titleText,
                  textAlign: TextAlign.center,
                  style: defaultStyle,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: buttonColor,
                  ),
                  child: const Center(
                    child: Text(
                      "Seleccionar",
                      textAlign: TextAlign.center,
                      style: substitleStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
