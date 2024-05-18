import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  ThemeData appThemeDate = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: true,
      fillColor: AppColors.veryLightGrey,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      hintStyle:
          AppStyles.lightStyle(color: AppColors.lightGrey, fontSize: 12.0),
      labelStyle: AppStyles.mediumStyle(color: Colors.grey),
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
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    ).copyWith(
      backgroundColor: AppColors.whiteColor,
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
