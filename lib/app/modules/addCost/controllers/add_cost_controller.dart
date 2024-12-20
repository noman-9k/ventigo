import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/modules/costsFilter/controllers/costs_filter_controller.dart';
import 'package:ventigo/app/modules/filters/controllers/filters_controller.dart';
import 'package:ventigo/app/modules/main/controllers/main_controller.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../app_services/category_service.dart';
import '../../../db/drift_db.dart';
import '../../dialog/dialog_functions.dart';

class AddCostController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoriesController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController numberOfUnits = TextEditingController();
  bool? deductFromTax;
  bool? systematicExpenditure;
  String? retrievalInterval;
  String? unitsOfMeasurement;
  List<DbCategory> selectedCategories = [];

  categoryTab(BuildContext context) async {
    pushCategorySelectDialog(
      context,
      categories: await CategoryService.to.getAllServicesCategories(),
      selectedCategories: selectedCategories,
      onDone: (categories) {
        selectedCategories = categories ?? [];
        categoriesController.text = selectedCategories.map((e) => e.name).join(', ');

        update();
      },
    );
  }

  onSubmitted() async {
    Get.closeAllSnackbars();

    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Name cannot be empty');
      return;
    }

    if (priceController.text.isEmpty) {
      Get.snackbar('Error', 'Price cannot be empty');
      return;
    }
    final price = double.tryParse(priceController.text);
    if (price == null) {
      Get.snackbar('Error', 'Price must be a number');
      return;
    }
    if (deductFromTax == null) {
      Get.snackbar('Error', 'Please select if it should be deducted from tax');
      return;
    }
    if (systematicExpenditure == null) {
      Get.snackbar('Error', 'Please select if it should be systematic expenditure');
      return;
    }
    if (retrievalInterval == null && (systematicExpenditure ?? false)) {
      Get.snackbar('Error', 'Please select a retrieval interval');
      return;
    }
    // if (numberOfUnits.text.isEmpty) {
    //   Get.snackbar('Error', 'Please select a number of units');
    //   return;
    // }

    List<String>? categories = selectedCategories.map((e) => e.name!).toList();

    if (categories.length == await CategoryService.to.getCategoriesCount()) {
      categories = ['All'];
      categoriesController.text = 'All';
    }

    DbController.to.appDb.insertCost(
      nameController.text,
      deductFromTax,
      systematicExpenditure,
      retrievalInterval ?? 'Do not repeat',
      numberOfUnits.text.isEmpty ? 1 : int.tryParse(numberOfUnits.text),
      price,
      unitsOfMeasurement ?? '',
      categories,
      DateTime.now().add(Duration(days: 0)).onlyDate(),
    );
    Get.back();
    Get.snackbar('Success', 'Cost added successfully');
    CostsFilterController.to.update();
    update();
  }
}
