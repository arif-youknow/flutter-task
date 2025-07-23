import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.brandColor,
  scaffoldBackgroundColor: AppColors.white,
  fontFamily: AppFonts.primaryFont,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.inputFieldcolor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18),
    bodyMedium: TextStyle(fontSize: 16),
    bodySmall: TextStyle(fontSize: 14),
  ),
);
