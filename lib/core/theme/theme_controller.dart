import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'light_theme.dart';
import 'dark_theme.dart';

enum ThemeMode { light, dark }

class ThemeController extends GetxController {
  final Rx<ThemeMode> _themeMode = ThemeMode.light.obs;

  ThemeData get themeData {
    return _themeMode.value == ThemeMode.light ? LightTheme.lightThemeData : DarkTheme.darkThemeData;
  }

  void toggleTheme() {
    _themeMode.value = _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
