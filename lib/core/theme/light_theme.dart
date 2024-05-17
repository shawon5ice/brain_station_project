import 'package:flutter/material.dart';
import 'package:template_project/core/constants/colors.dart';

class LightTheme {
  static ThemeData lightThemeData = ThemeData.light().copyWith(
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: AppColors.lightModeHeadingTextColor),
      bodyLarge: TextStyle(
        color: AppColors.lightModeContentTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      // Add more text styles as needed
    ),
  );
}
