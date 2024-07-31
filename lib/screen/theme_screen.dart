// Written by  Juan Pablo Gutiérrez
// 09 07 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/system/user_settings.dart';
import 'package:self_blog/widgets/back_bar.dart';
import 'package:self_blog/widgets/color_picker_box.dart';
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
    return GradientScaffold(
      getGradientFunction: getPrimaryGradient(),
      isCentered: true,
      isInSafeArea: true,
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      body: Column(
        children: [
          const BackBar(),
          const StandardSpacer(
            value: standardSpacerHeight,
            direction: Direction.vertical,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ColorPickerBox(
                    boxTitle: "Select Primary color",
                    onColorChanged: (Color color) {
                      setState(() {
                        primaryColor = color;
                      });
                    },
                  ),
                  ColorPickerBox(
                    boxTitle: "Select Secondary color",
                    onColorChanged: (Color color) {
                      setState(() {
                        secondaryColor = color;
                      });
                    },
                  ),
                  ColorPickerBox(
                    boxTitle: "Select Tertiary color",
                    onColorChanged: (Color color) {
                      setState(() {
                        tertiaryColor = color;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
