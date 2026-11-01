import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/theme/app_theme.dart';
import 'package:shoply_app/features/theme/view_model/cubit.dart';
import 'package:shoply_app/features/theme/view_model/state.dart';

class ShoplyApp extends StatelessWidget {
  const ShoplyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..initTheme(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final cubit = context.read<ThemeCubit>();
          return MaterialApp(
            title: 'Shoply App',
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: AppPages.splashScreen,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeLight,
            darkTheme: AppTheme.themeDark,
            themeMode: cubit.themeMode,
          );
        },
      ),
    );
  }
}
