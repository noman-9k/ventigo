import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/filters/controllers/filters_controller.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../../../generated/l10n.dart';

class DateSection extends GetView<FiltersController> {
  const DateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        AppText.boldText(S.of(context).dates),
        5.verticalSpace,
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: S.of(context).from),
                controller: controller.fromDateController,
                readOnly: true,
                onTap: () {
                  controller.selectDate(context, isFromDate: true);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: S.of(context).to),
                controller: controller.toDateController,
                readOnly: true,
                onTap: () {
                  controller.selectDate(context, isFromDate: false);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
