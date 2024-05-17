import 'package:flutter/material.dart';
import 'package:template_project/core/constants/colors.dart';
import 'package:template_project/core/theme/theme_controller.dart';

class DarkTheme extends ThemeController {
  static ThemeData darkThemeData = ThemeData.dark().copyWith(
    // Define dark mode text themes here
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: AppColors.darkModeHeadingTextColor),
      bodyLarge: TextStyle(
          color: AppColors.darkModeContentTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      // Add more text styles as needed
    ),
  );
}
