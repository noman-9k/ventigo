import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../db/db_controller.dart';
import '../../../db/drift_db.dart';
import '../../filters/db_filter/costs_filter.dart';

class CostsFilterController extends GetxController {
  Stream<List<DbCost>> currentCostStream = DbController.to.appDb.getAllCosts();
  CostsFilter? filter;

  bool? isDeductFromTax;

  bool? isSystematicExpenditure;

  String? repetitionInterval;

  String? unitOfMeasurements;
  TextEditingController nameController = TextEditingController();

  TextEditingController minPriceController = TextEditingController();

  TextEditingController maxPriceController = TextEditingController();
  getFilteredCosts() {
    filter = CostsFilter(
      name: nameController.text,
      minPrice: double.tryParse(minPriceController.text),
      maxPrice: double.tryParse(maxPriceController.text),
      deductFromTax: isDeductFromTax,
      systematicExpenditure: isSystematicExpenditure,
      repetitionInterval: repetitionInterval,
      unitOfMeasurements: unitOfMeasurements,
    );

    if (filter == null) {
      currentCostStream = DbController.to.appDb.getAllCosts();
    } else {
      currentCostStream = DbController.to.appDb.getFilteredCosts(filter);
    }
    update();
    Get.back();
  }

  onCategoryChanged(String? p1) {}

  clearFilters() {
    nameController.clear();
    minPriceController.clear();
    maxPriceController.clear();
    isDeductFromTax = null;
    isSystematicExpenditure = null;
    repetitionInterval = null;
    unitOfMeasurements = null;
    currentCostStream = DbController.to.appDb.getAllCosts();
    update();
    Get.back();
  }
}
