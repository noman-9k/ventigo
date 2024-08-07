import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle thinStyle({Color? color}) {
    return GoogleFonts.roboto(
        fontSize: 12.sp, color: color ?? AppColors.primaryColor);
  }

  static TextStyle lightStyle(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      double? height}) {
    return GoogleFonts.poppins(
        fontSize: fontSize ?? 10.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: height,
        color: color ?? AppColors.primaryColor);
  }

  static TextStyle mediumStyle(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color);
  }

  static TextStyle boldStyle(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? AppColors.primaryColor);
  }
}
