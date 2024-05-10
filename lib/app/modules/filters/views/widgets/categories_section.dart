import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';
import 'package:ventigo/app/db/tables/tables.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../../../config/app_colors.dart';
import '../../controllers/filters_controller.dart';

class CategoriesSection extends GetView<FiltersController> {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DbCategory>>(
        future: DbController.to.appDb.getAllCategoriesF(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          var categories = snapshot.data;

          return ExpansionTile(
            collapsedBackgroundColor: AppColors.veryLightGrey,
            collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), side: BorderSide.none),
            shape: RoundedRectangleBorder(side: BorderSide.none),
            title: AppText.boldText('Categories'),
            children: categories!.map((e) {
              return GetBuilder<FiltersController>(builder: (controller) {
                return CheckboxListTile(
                  title: Text(e.name ?? ''),
                  value: controller.selectedCategories.contains(e),
                  onChanged: (value) {
                    if (value == true) {
                      controller.selectedCategories.add(e);
                    } else {
                      controller.selectedCategories.remove(e);
                    }
                    controller.update();
                  },
                );
              });
            }).toList(),
          );
        });
  }
}
