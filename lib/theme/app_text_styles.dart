import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle heroTitle = TextStyle(
    fontFamily: 'Bangers',
    fontSize: 82,
    height: 1,
    letterSpacing: 2,
    color: AppColors.textPrimary,
  );

  static const TextStyle heroSubtitle = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontSize: 20,
    height: 1.7,
    color: AppColors.textSecondary,
  );

  static const TextStyle navText = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
    color: AppColors.textPrimary,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: 'Bangers',
    fontSize: 42,
    letterSpacing: 1.5,
    color: AppColors.textPrimary,
  );
}