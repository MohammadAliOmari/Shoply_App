import 'package:flutter/material.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/features/onboarding/view/on_boarding_screen.dart';
import 'package:shoply_app/features/splash/view/splash_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.splashScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );

      case AppPages.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) {
            return OnBoardingScreen();
          },
        );
    }
    return null;
  }
}
