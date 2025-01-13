import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/modules/addReport/controllers/add_report_controller.dart';
import 'package:ventigo/app/modules/costsFilter/controllers/costs_filter_controller.dart';
import 'package:ventigo/extensions/date_extension.dart';
import 'package:ventigo/extensions/list_extension.dart';

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

  @override
  void onInit() {
    numberOfUnits.text = '1';
    super.onInit();
  }

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

    List<String>? categories = selectedCategories.map((e) => e.name!).toList();

    if (categories.length == await CategoryService.to.getCategoriesCount() || categories.length == 0) {
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

  Future<List> fetchCategoriesName() async {
    List<SearchItem> list = [];

    List<DbCost> dataItems = await DbController.to.appDb.getAllCostsF();

    dataItems.forEach((element) {
      list.add(SearchItem(label: element.name!.replaceAll('\n', ' - '), value: element.id.toString()));
    });

    return list.myDistinct();
  }

  onSearchItemChanged(SearchItem value) async {
    int? itemId = int.tryParse(value.value);
    if (itemId == null) {
      return;
    }

    DbCost? item = await DbController.to.appDb.getCostById(itemId);

    if (item != null) {
      onSystematicExpenditureChanged(value: item.isSystematic);
      onDeductFromTaxChanged(value: item.isSystematic);

      nameController.text = item.name ?? '';
      priceController.text = item.price.toString();
      categoriesController.text = item.categories.join(', ');
      deductFromTax = item.isDeductFromTax;
      systematicExpenditure = item.isSystematic;
      retrievalInterval = item.repetitionInterval;
      unitsOfMeasurement = item.unitsOfMeasurement;

      update();
    }
  }

  void onSystematicExpenditureChanged({bool? value}) {
    if (value == null) {
      return;
    }
    systematicExpenditure = value;
    update();
  }

  void onDeductFromTaxChanged({bool? value}) {
    if (value == null) {
      return;
    }
    deductFromTax = value;
    update();
  }
}
