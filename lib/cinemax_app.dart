import 'package:cinemax/core/routes/app_router.dart';
import 'package:cinemax/core/routes/app_routes.dart';
import 'package:cinemax/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
class CinemaxApp extends StatelessWidget {
  const CinemaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: AppRoutes.homeScreen,
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }
}
