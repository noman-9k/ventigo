import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/filters/controllers/filters_controller.dart';
import 'package:ventigo/config/app_text.dart';

class PriceRangeSlider extends StatelessWidget {
  const PriceRangeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FiltersController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.boldText(
              'Price Range ( ${controller.priceRange.start.toStringAsFixed(0)} - ${controller.priceRange.end.toStringAsFixed(0)} )'),
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.mediumText(
                    controller.priceRange.start.toStringAsFixed(0),
                    fontSize: 16.sp),
                AppText.mediumText(controller.priceRange.end.toStringAsFixed(0),
                    fontSize: 16.sp),
              ],
            ),
          ),
          RangeSlider(
              values: controller.priceRange,
              min: 0,
              max: 1000,
              divisions: 100,
              onChanged: (RangeValues values) {
                controller.priceRange = values;
                controller.update();
              }),
        ],
      );
    });
  }
}
