import 'package:flutter/material.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/features/categories/view/categories_screen.dart';
import 'package:shoply_app/features/home/view/home_screen.dart';
import 'package:shoply_app/features/layout/view/layout_screen.dart';
import 'package:shoply_app/features/login/view/login_screen.dart';
import 'package:shoply_app/features/onboarding/view/on_boarding_screen.dart';
import 'package:shoply_app/features/products/view/products_screen.dart';
import 'package:shoply_app/features/signup/view/singup_screen.dart';
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
      case AppPages.loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );
      case AppPages.signupScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const SignupScreen();
          },
        );
      case AppPages.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );

      case AppPages.layoutScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const LayoutScreen();
          },
        );

      case AppPages.categoriesScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const CategoriesScreen();
          },
        );

      case AppPages.productScreen:
        return MaterialPageRoute(
          builder: (context) {
            final arguments = settings.arguments as Map<String, dynamic>;
            final titleText = arguments['titleText'] as String;
            final categoryId = arguments['categoryId'] as String;
            return ProductsScreen(titleText: titleText, categoryId: categoryId);
          },
        );
    }
    return null;
  }
}
