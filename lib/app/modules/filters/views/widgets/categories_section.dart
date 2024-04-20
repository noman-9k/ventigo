import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../../../config/app_colors.dart';
import '../../controllers/filters_controller.dart';

class CategoriesSection extends GetView<FiltersController> {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FiltersController>(builder: (controller) {
      return ExpansionTile(
        collapsedBackgroundColor: AppColors.veryLightGrey,
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), side: BorderSide.none),
        shape: RoundedRectangleBorder(side: BorderSide.none),
        title: AppText.boldText('Categories'),
        children: [
          for (var item in controller.categoriesList)
            CheckboxListTile(
              title: Text(item.name),
              value: controller.selectedCategories.contains(item),
              onChanged: (value) {
                if (value == true) {
                  controller.selectedCategories.add(item);
                } else {
                  controller.selectedCategories.remove(item);
                }
                controller.update();
              },
            ),
        ],
      );
    });
  }
}
