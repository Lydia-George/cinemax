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

  static const TextStyle authAppBar = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle appName = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  );

  static const TextStyle welcomeSubtitle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
    height: 1.25,
  );

  static const TextStyle welcomeFooter = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
  );


  static const TextStyle authSubtitle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    height: 1.4,
  );

  static const TextStyle inputLabel = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 12,
  );

  static const TextStyle inputText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
  );

  static const TextStyle inputHint = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
  );

  static const TextStyle authLink = TextStyle(
    color: AppColors.accentColor,
    fontSize: 12,
  );

  static const TextStyle terms = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    height: 1.4,
  );

  static const TextStyle authTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle homeGreeting = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle homeSubtitle = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  static const TextStyle categoryLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle movieTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle movieGenre = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
  );

  static const TextStyle movieRating = TextStyle(
    color: AppColors.ratingColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );



}