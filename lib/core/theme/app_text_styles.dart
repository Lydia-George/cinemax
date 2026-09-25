import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle onboardingTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle onboardingDescription = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    height: 1.3,
  );

  static const TextStyle button = TextStyle(
    color: AppColors.backgroundColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}