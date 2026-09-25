import 'package:cinemax/core/theme/app_theme.dart';
import 'package:cinemax/feature/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
class CinemaxApp extends StatelessWidget {
  const CinemaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: OnboardingScreen(),
    );
  }
}
