import 'package:flutter/material.dart';
import 'package:ventigo/config/app_styles.dart';

class AppText {
  AppText._();
  static Widget lightText(String text, {Color? color}) {
    return Text(text, style: AppStyles.lightStyle(color: color));
  }

  static mediumText(String s,
      {Color? color,
      TextAlign? align,
      double? fontSize,
      int? maxLines,
      FontWeight? fontWeight}) {
    return Text(s,
        style: AppStyles.mediumStyle(
            color: color, fontSize: fontSize, fontWeight: fontWeight),
        maxLines: maxLines,
        textAlign: align);
  }

  static boldText(String s, {Color? color, double? fontSize}) {
    return Text(s,
        style: AppStyles.boldStyle(color: color, fontSize: fontSize));
  }

  static mediumBoldText(String s, {Color? color, double? fontSize}) {
    return Text(s,
        style: AppStyles.mediumStyle(
            fontWeight: FontWeight.w600, fontSize: fontSize ?? 16));
  }
}
