import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../db/db_controller.dart';
import '../../../db/drift_db.dart';
import '../../filters/db_filter/costs_filter.dart';

class CostsFilterController extends GetxController {
  static CostsFilterController get to => Get.find();
  Stream<List<DbCost>> currentCostStream = DbController.to.appDb.getAllCosts();
  CostsFilter? filter;

  bool? isDeductFromTax;

  bool? isSystematicExpenditure;

  String? repetitionInterval;

  String? unitOfMeasurements;
  TextEditingController nameController = TextEditingController();

  TextEditingController minPriceController = TextEditingController();

  TextEditingController maxPriceController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  DateTime? fromDate;
  DateTime? toDate;

  getFilteredCosts() {
    filter = CostsFilter(
      name: nameController.text,
      minPrice: double.tryParse(minPriceController.text),
      maxPrice: double.tryParse(maxPriceController.text),
      deductFromTax: isDeductFromTax,
      systematicExpenditure: isSystematicExpenditure,
      repetitionInterval: repetitionInterval,
      unitOfMeasurements: unitOfMeasurements,
      fromDate: fromDate,
      toDate: toDate,
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
    fromDateController.clear();
    toDateController.clear();
    fromDate = null;
    toDate = null;
    update();
    Get.back();
  }

  void selectDateRange(BuildContext context) {
    showDateRangePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(3000)).then((value) {
      if (value != null) {
        fromDate = value.start;
        toDate = value.end.add(const Duration(days: 1)).subtract(const Duration(minutes: 1));
        fromDateController.text = fromDate!.smallDate();
        toDateController.text = toDate!.smallDate();
      }
    });
  }

  Future<String?>? getTotalCosts() {
    return DbController.to.appDb.getTotalCosts(fromDate ?? DateTime(DateTime.now().year, DateTime.now().month), toDate);
  }
}
