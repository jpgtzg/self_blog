// Written by Juan Pablo Gutiérrez
// 23 07 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future<Color> getPrimaryColor() async {
  SharedPreferences prefs = await _prefs;

  final color = prefs.getInt('primaryColor') ?? paleteDarkBlue.value;
  return Color(color);
}

Future<Color> getSecondaryColor() async {
  SharedPreferences prefs = await _prefs;

  final color = prefs.getInt('secondaryColor') ?? paleteLightBlue.value;
  return Color(color);
}

Future<Color> getTertiaryColor() async {
  SharedPreferences prefs = await _prefs;

  final color = prefs.getInt('tertiaryColor') ?? paleteBlue.value;
  return Color(color);
}

Future<SweepGradient> getPrimaryGradient() async {
  Color primaryColor = await getPrimaryColor();
  Color secondaryColor = await getSecondaryColor();
  Color tertiaryColor = await getTertiaryColor();

  return SweepGradient(
    center: FractionalOffset.topLeft,
    colors: [primaryColor, secondaryColor, tertiaryColor],
  );
}

set primaryColor(Color color) {
  _prefs.then((value) => value.setInt('primaryColor', color.value));
}

set secondaryColor(Color color) {
  _prefs.then((value) => value.setInt('secondaryColor', color.value));
}

set tertiaryColor(Color color) {
  _prefs.then((value) => value.setInt('tertiaryColor', color.value));
}
