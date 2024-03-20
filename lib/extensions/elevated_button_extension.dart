// alterP [Change properties of ElevatedButton]
import 'package:flutter/material.dart';

import '../config/app_colors.dart';

extension ElevatedButtonExtension on ElevatedButton {
  ElevatedButton alterP(
      {Color color = AppColors.primaryColor, bool isTransparent = false}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        overlayColor: isTransparent
            ? MaterialStateProperty.all<Color>(AppColors.veryLightGrey)
            : MaterialStateProperty.all<Color>(AppColors.primaryColor),
        maximumSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 60.0)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
        minimumSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 50.0)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 8.0)),
        backgroundColor: isTransparent
            ? MaterialStateProperty.all<Color>(AppColors.veryLightGrey)
            : MaterialStateProperty.all<Color>(color),
        elevation: MaterialStateProperty.all<double>(isTransparent ? 0 : 1.0),
        foregroundColor: isTransparent
            ? MaterialStateProperty.all<Color>(Colors.black)
            : MaterialStateProperty.all<Color>(AppColors.whiteColor),
        shadowColor: isTransparent
            ? MaterialStateProperty.all<Color>(Colors.transparent)
            : MaterialStateProperty.all<Color>(color),
      ),
    );
  }
}
