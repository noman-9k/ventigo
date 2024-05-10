import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/models/caregory.dart';
import 'package:ventigo/app/models/employee.dart';
import 'package:ventigo/app/models/service.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../app_services/employee_service.dart';
import '../../../db/drift_db.dart';
import '../../dialog/dialog_functions.dart';

class FiltersController extends GetxController {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  @override
  void onInit() {
    super.onInit();
  }

  List<Category> categoriesList = [];
  List<AppService> servicesList = [];

  List<DbEmployee> selectedMaster = [];
  List<DbCategory> selectedCategories = [];
  List<DbService> selectedServices = [];

  RangeValues priceRange = const RangeValues(0, 1000);

  selectDate(BuildContext context, TextEditingController toDateController,
      DateTime date) {
    pushDatePicker(context, (value) {
      date = value;
      toDateController.text = value.format('dd.MM.yyyy');
    });
  }

  applyFilters() {
    Get.back();
  }
}
