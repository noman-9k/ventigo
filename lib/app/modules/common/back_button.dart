import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/common/svg_icon.dart';

import '../../constants/app_images.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onBack});
  final Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onBack ??
            () {
              Get.back();
            },
        child: SvgIcon(icon: AppImages.arrow_back, size: 20),
      ),
    );
  }
}
