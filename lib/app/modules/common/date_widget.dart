import 'package:flutter/material.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../config/app_text.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.veryLightBlue,
            borderRadius: BorderRadius.circular(50)),
        child: AppText.mediumText(DateTime.now().smallDate()),
      ),
    );
  }
}
