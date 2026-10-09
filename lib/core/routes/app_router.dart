import 'package:cinemax/core/di/service_locator.dart';
import 'package:cinemax/core/routes/app_routes.dart';
import 'package:cinemax/feature/auth/login_signup/presentation/ui/login_or_signup_screen.dart';
import 'package:cinemax/feature/auth/signup/presentation/ui/signup_screen.dart';
import 'package:cinemax/feature/home/data/repo/movies_repo.dart';
import 'package:cinemax/feature/home/presentation/cubit/movies_cubit.dart';
import 'package:cinemax/feature/home/presentation/ui/home_screen.dart';
import 'package:cinemax/feature/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case AppRoutes.loginOrSignupScreen:
        return MaterialPageRoute(builder: (_) => LoginOrSignupScreen());
      case AppRoutes.signupScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) =>
            MoviesCubit(getIt<MoviesRepo>())..getPopularMovies(),
            child: HomeScreen(),
          ),
        );

        default:
          return null;
    }
  }
}
