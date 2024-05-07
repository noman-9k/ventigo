import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/employee_service.dart';
import 'package:ventigo/app/db/drift_db.dart';
import 'package:ventigo/app/modules/filters/controllers/filters_controller.dart';
import 'package:ventigo/config/app_colors.dart';

import '../../../../../config/app_text.dart';

class MastersSelection extends GetView<FiltersController> {
  const MastersSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DbEmployee>>(
        future: EmployeeService.to.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          var employees = snapshot.data;

          return ExpansionTile(
            collapsedBackgroundColor: AppColors.veryLightGrey,
            collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), side: BorderSide.none),
            shape: RoundedRectangleBorder(side: BorderSide.none),
            title: AppText.boldText('Masters'),
            children: employees!
                .map(
                    (e) => GetBuilder<FiltersController>(builder: (controller) {
                          return CheckboxListTile(
                            title: Text(e.name ?? ''),
                            value: controller.selectedMaster.contains(e),
                            onChanged: (value) {
                              log('value: $value');
                              if (value == true) {
                                controller.selectedMaster.add(e);
                              } else {
                                controller.selectedMaster.remove(e);
                              }
                              controller.update();
                            },
                          );
                        }))
                .toList(),
          );
        });
  }
}
