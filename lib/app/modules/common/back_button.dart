import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onBack});
  final Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBack ??
          () {
            Get.back();
          },
      child: Container(
        margin: EdgeInsets.all(7),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.veryLightGrey),
        child: Icon(CupertinoIcons.back),
      ),
    );
  }
}
