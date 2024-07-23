// Written by Juan Pablo Gutiérrez
// 23 07 2024

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';

class ColorPickerBox extends StatelessWidget {
  final String boxTitle;
  final Function(Color) onColorChanged;
  const ColorPickerBox({super.key, required this.boxTitle, required this.onColorChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
          boxTitle,
          style: smallerDefaultStyle,
        ),
        ColorPicker(
          showMaterialName: true,
          showColorName: true,
          showColorCode: true,
          enableTonalPalette: true,
          enableShadesSelection: false,
          onColorChanged: onColorChanged,
          pickersEnabled: const <ColorPickerType, bool>{
            ColorPickerType.both: false,
            ColorPickerType.primary: false,
            ColorPickerType.accent: false,
            ColorPickerType.wheel: true,
            ColorPickerType.bw: false,
            ColorPickerType.custom: false,
          },
        )
      ],
    );
  }
}
