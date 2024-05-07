import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/db/drift_db.dart';
import 'package:ventigo/app/modules/filters/controllers/filters_controller.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../../../config/app_colors.dart';
import '../../../../db/db_controller.dart';

class ServicesSection extends GetView<FiltersController> {
  const ServicesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DbService>>(
        future: DbController.to.appDb.getAllServicesF(),
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
            title: AppText.boldText('Services'),
            children: categories!.map((e) {
              return GetBuilder<FiltersController>(builder: (controller) {
                return CheckboxListTile(
                  title: Text(e.name ?? ''),
                  value: controller.selectedServices.contains(e),
                  onChanged: (value) {
                    if (value == true) {
                      controller.selectedServices.add(e);
                    } else {
                      controller.selectedServices.remove(e);
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
