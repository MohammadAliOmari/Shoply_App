import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/fonts/app_fonts.dart';
import 'package:shoply_app/core/utils/theme/app_colors.dart';

class AppTheme {
  static ThemeData themeLight = ThemeData(
    fontFamily: AppFonts.quikSand,
    scaffoldBackgroundColor: AppColors.backgrround,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.primaryColor,
      onSecondary: AppColors.onPrimary,
      error: AppColors.error,
      onError: AppColors.onError,
      surface: AppColors.backgrround,
      onSurface: Colors.black,
    ),
  );
}
