import 'package:flutter/material.dart';
import 'package:ventigo/config/app_styles.dart';

class AppText {
  AppText._();
  static Widget lightText(String text, {Color? color}) {
    return Text(text, style: AppStyles.lightStyle(color: color));
  }

  static mediumText(String s, {Color? color}) {
    return Text(s, style: AppStyles.mediumStyle(color: color));
  }

  static boldText(String s, {required Color color, double? fontSize}) {
    return Text(s,
        style: AppStyles.boldStyle(color: color, fontSize: fontSize));
  }
}
