import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/model/order/response_order.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/features/cart/view/cart_screen.dart';
import 'package:shoply_app/features/categories/view/categories_screen.dart';
import 'package:shoply_app/features/home/view/home_screen.dart';
import 'package:shoply_app/features/layout/view/layout_screen.dart';
import 'package:shoply_app/features/layout/view_model/cubit.dart';
import 'package:shoply_app/features/login/view/login_screen.dart';
import 'package:shoply_app/features/onboarding/view/on_boarding_screen.dart';
import 'package:shoply_app/features/order_details/view/order_details_screen.dart';
import 'package:shoply_app/features/orders/view/order_screen.dart';
import 'package:shoply_app/features/product_details/view/product_details_screen.dart';
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
    }
    return null;
  }
}
