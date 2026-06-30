import 'package:flutter/material.dart';

class AppColors {
  static const Color peacockBlue = Color(0xFF0F3D5C);
  static const Color deepBlue = Color(0xFF071E2E);
  static const Color gold = Color(0xFFD4AF37);
  static const Color lightGold = Color(0xFFF4E5B2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF111111);
  static const Color grey = Color(0xFF8E8E8E);
  static const Color lightGrey = Color(0xFFF2F2F2);
  static const Color storyGradientStart = Color(0xFFD4AF37);
  static const Color storyGradientEnd = Color(0xFF0F3D5C);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.peacockBlue,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.peacockBlue,
      primary: AppColors.peacockBlue,
      secondary: AppColors.gold,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.black),
    ),
    fontFamily: 'Roboto',
  );
}
