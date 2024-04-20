import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/filters/controllers/filters_controller.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../../../config/app_colors.dart';

class ServicesSection extends GetView<FiltersController> {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FiltersController>(builder: (controller) {
      return ExpansionTile(
        collapsedBackgroundColor: AppColors.veryLightGrey,
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), side: BorderSide.none),
        shape: RoundedRectangleBorder(side: BorderSide.none),
        title: AppText.boldText('Services'),
        children: [
          for (var item in controller.servicesList)
            CheckboxListTile(
              title: Text(item.name),
              value: controller.selectedServices.contains(item),
              onChanged: (value) {
                if (value == true) {
                  controller.selectedServices.add(item);
                } else {
                  controller.selectedServices.remove(item);
                }
                controller.update();
              },
            ),
        ],
      );
    });
  }
}
