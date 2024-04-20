import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/filters/controllers/filters_controller.dart';
import 'package:ventigo/config/app_colors.dart';

import '../../../../../config/app_text.dart';

class MastersSelection extends GetView<FiltersController> {
  const MastersSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FiltersController>(builder: (controller) {
      return ExpansionTile(
        collapsedBackgroundColor: AppColors.veryLightGrey,
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), side: BorderSide.none),
        shape: RoundedRectangleBorder(side: BorderSide.none),
        title: AppText.boldText('Masters'),
        children: [
          for (var item in controller.mastersList)
            CheckboxListTile(
              title: Text(item.name),
              value: controller.selectedMaster.contains(item),
              onChanged: (value) {
                if (value == true) {
                  controller.selectedMaster.add(item);
                } else {
                  controller.selectedMaster.remove(item);
                }
                controller.update();
              },
            ),
        ],
      );
    });
  }
}
