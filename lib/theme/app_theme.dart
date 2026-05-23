import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.neonPink,
    fontFamily: 'SpaceGrotesk',

    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.textPrimary,
      ),
    ),
  );
}