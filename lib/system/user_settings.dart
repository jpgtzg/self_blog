// Written by Juan Pablo Gutiérrez
// 23 07 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

late UserSettings userSettings;

void initUserSettings() async {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  userSettings = UserSettings(prefs: await prefs);
  userSettings.primaryColor = paleteDarkBlue;
  userSettings.secondaryColor = paleteLightBlue;
  userSettings.tertiaryColor = paleteBlue;
}

class UserSettings {
  late SharedPreferences prefs;
  late SweepGradient primaryGradient;
  late SweepGradient secondaryGradient;

  UserSettings({required this.prefs});

  Color get primaryColor {
    final color = prefs.getInt('primaryColor') ?? 0xFF000000;
    return Color(color);
  }

  Color get secondaryColor {
    final color = prefs.getInt('secondaryColor') ?? 0xFF000000;
    return Color(color);
  }

  Color get tertiaryColor {
    final color = prefs.getInt('tertiaryColor') ?? 0xFF000000;
    return Color(color);
  }

  set primaryColor(Color color) {
    prefs.setInt('primaryColor', color.value);

    primaryGradient = SweepGradient(
      center: FractionalOffset.topLeft,
      colors: [color, secondaryColor, tertiaryColor],
    );
  }

  set secondaryColor(Color color) {
    prefs.setInt('secondaryColor', color.value);

    primaryGradient = SweepGradient(
      center: FractionalOffset.topLeft,
      colors: [primaryColor, color, tertiaryColor],
    );
  }

  set tertiaryColor(Color color) {
    prefs.setInt('tertiaryColor', color.value);

    primaryGradient = SweepGradient(
      center: FractionalOffset.topLeft,
      colors: [primaryColor, secondaryColor, color],
    );
  }
}
