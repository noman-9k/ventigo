import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/app_text.dart';
import '../../../../../generated/l10n.dart';
import '../../controllers/costs_filter_controller.dart';

class CostsDateSection extends GetView<CostsFilterController> {
  const CostsDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        AppText.boldText(S.of(context).dates),
        5.verticalSpace,
        Row(children: [
          Expanded(
            child: ElevatedButton(
                onPressed: () {
                  controller.selectDateRange(context);
                },
                child: Text(S.of(context).selectDates)),
          ),
          10.horizontalSpace,
          Expanded(
              child: TextField(
            controller: controller.fromDateController,
            decoration: InputDecoration(labelText: S.of(context).from),
            readOnly: true,
          )),
          5.horizontalSpace,
          Expanded(
              child: TextField(
            controller: controller.toDateController,
            decoration: InputDecoration(labelText: S.of(context).to),
            readOnly: true,
          )),
        ]),
      ],
    );
  }
}
