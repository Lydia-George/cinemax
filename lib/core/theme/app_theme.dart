import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.backgroundColor,
      surface: AppColors.backgroundColor,
      onSurface: AppColors.textPrimary,
    ),
    textTheme: const TextTheme(
      titleLarge: AppTextStyles.onboardingTitle,
      bodyMedium: AppTextStyles.onboardingDescription,
    ),
  );
}