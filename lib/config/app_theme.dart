import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  ThemeData appThemeDate = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: true,
      fillColor: AppColors.veryLightGrey,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      hintStyle: AppStyles.lightStyle(color: AppColors.lightGrey),
      labelStyle: AppStyles.lightStyle(),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent)),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      prefixStyle: AppStyles.lightStyle(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        maximumSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 60.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
        minimumSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 50.0)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 8.0)),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.blueColor),
        elevation: MaterialStateProperty.all<double>(0.0),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  );
}