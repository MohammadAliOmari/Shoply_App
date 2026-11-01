import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/model/order/response_order.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/features/about/view/about_screen.dart';
import 'package:shoply_app/features/cart/view/cart_screen.dart';
import 'package:shoply_app/features/categories/view/categories_screen.dart';
import 'package:shoply_app/features/change_password/view/change_password_screen.dart';
import 'package:shoply_app/features/edit_profile/view/edit_profile_screen.dart';
import 'package:shoply_app/features/forgot_password/view/forgot_password_screen.dart';
import 'package:shoply_app/features/home/view/home_screen.dart';
import 'package:shoply_app/features/layout/view/layout_screen.dart';
import 'package:shoply_app/features/layout/view_model/cubit.dart';
import 'package:shoply_app/features/login/view/login_screen.dart';
import 'package:shoply_app/features/onboarding/view/on_boarding_screen.dart';
import 'package:shoply_app/features/order_details/view/order_details_screen.dart';
import 'package:shoply_app/features/orders/view/order_screen.dart';
import 'package:shoply_app/features/product_details/view/product_details_screen.dart';
import 'package:shoply_app/features/products/view/products_screen.dart';
import 'package:shoply_app/features/setting/view/settings_screen.dart';
import 'package:shoply_app/features/signup/view/singup_screen.dart';
import 'package:shoply_app/features/splash/view/splash_screen.dart';
import 'package:shoply_app/features/theme/view/theme_screen.dart';
import 'package:shoply_app/features/trending_product/view/trending_product_screen.dart';

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
      case AppPages.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const ForgotPasswordScreen();
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
          builder: (_) {
            return const CategoriesScreen();
          },
        );

      case AppPages.productScreen:
        return MaterialPageRoute(
          builder: (_) {
            final arguments = settings.arguments as Map<String, dynamic>;
            final titleText = arguments['titleText'] as String;
            final categoryId = arguments['categoryId'] as String;
            final context = arguments['context'] as BuildContext;
            return BlocProvider.value(
              value: context.read<LayoutCubit>(),
              child: ProductsScreen(
                titleText: titleText,
                categoryId: categoryId,
              ),
            );
          },
        );

      case AppPages.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) {
            final arguments = settings.arguments as Map<String, dynamic>;
            final responseProducts =
                arguments['responseProducts'] as ResponseProducts;
            final context = arguments['context'] as BuildContext;
            return BlocProvider.value(
              value: context.read<LayoutCubit>(),
              child: ProductDetailsScreen(responseProducts: responseProducts),
            );
          },
        );
      case AppPages.cartScreen:
        return MaterialPageRoute(
          builder: (context) {
            return CartScreen();
          },
        );
      case AppPages.orderScreen:
        return MaterialPageRoute(
          builder: (context) {
            return OrderScreen();
          },
        );
      case AppPages.orderDetailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            final arguments = settings.arguments as Map<String, dynamic>;
            final order = arguments['order'] as OrderResponse;
            return OrderDetailsScreen(order: order);
          },
        );
      case AppPages.settingsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SettingsScreen();
          },
        );
      case AppPages.themeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return ThemeScreen();
          },
        );

      case AppPages.trendingProductScreen:
        return MaterialPageRoute(
          builder: (_) {
            final arguments = settings.arguments as Map<String, dynamic>;
            final context = arguments['context'] as BuildContext;
            return BlocProvider.value(
              value: context.read<LayoutCubit>(),
              child: TrendingProductScreen(),
            );
          },
        );
      case AppPages.editProfileScreen:
        return MaterialPageRoute<bool>(
          builder: (context) {
            return EditProfileScreen();
          },
        );
      case AppPages.aboutScreen:
        return MaterialPageRoute(
          builder: (context) {
            return AboutScreen();
          },
        );

      case AppPages.changePasswordScreen:
        return MaterialPageRoute(
          builder: (context) {
            return ChangePasswordScreen();
          },
        );
    }
    return null;
  }
}
