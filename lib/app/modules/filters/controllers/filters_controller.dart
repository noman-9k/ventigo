import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/models/caregory.dart';
import 'package:ventigo/app/models/service.dart';
import 'package:ventigo/app/modules/main/controllers/main_controller.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../db/drift_db.dart';
import '../../dialog/dialog_functions.dart';
import '../db_filter/user_data_filter.dart';

class FiltersController extends GetxController {
  static FiltersController get to => Get.find<FiltersController>();

  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  DateTime? fromDate;
  DateTime? toDate;

  List<Category> categoriesList = [];
  List<AppService> servicesList = [];
  List<String> selectedMaster = [];
  List<DbCategory> selectedCategories = [];
  List<DbService> selectedServices = [];

  bool? isRegularCustomer;

  bool? isCustomerCard;
  bool? isNewCustomer;

  Stream<List<DbDataItem>>? filterStream;

  applyFilters() {
    var filter = UserDataFilter(
      asc: true,
      orderingColumn: 'name',
      selectQuery: 'SELECT * FROM db_employees',
      fromDate: fromDate,
      toDate: toDate,
      name: nameController.text,
      phone: phoneController.text,
      priceFrom: double.tryParse(minPriceController.text),
      priceTo: double.tryParse(maxPriceController.text),
      selectedMasters: selectedMaster,
      selectedCategories: selectedCategories.map((e) => e.name!).toList(),
      isRegularCustomer: isRegularCustomer,
      isCustomerCard: isCustomerCard,
      isNewCustomer: isNewCustomer,
    );

    // MainController.to.getReports(stream: filterStream);
    MainController.to.getFilteredDataItems(filter: filter);

    Get.back();
  }

  clearFilters() {
    fromDateController.clear();
    toDateController.clear();
    nameController.clear();
    maxPriceController.clear();
    minPriceController.clear();
    phoneController.clear();
    fromDate = null;
    toDate = null;
    selectedMaster.clear();
    selectedCategories.clear();
    selectedServices.clear();
    isRegularCustomer = null;
    isCustomerCard = null;
    isNewCustomer = null;

    filterStream = null;
    MainController.to.getFilteredDataItems();
    update();
  }

  selectDate(BuildContext context, {bool isFromDate = false}) {
    pushDatePicker(context, (value) {
      if (isFromDate) {
        fromDate = value;
        fromDateController.text = value.format('dd.MM.yyyy');
      } else {
        toDate = value;
        toDateController.text = value.format('dd.MM.yyyy');
      }
    });
    log('Date isFromDate: $fromDate ' '  $toDate');
  }

  getCount() async {
    var count = await DbController.to.appDb.count('db_employees');
    // DbController.to.tables.forEach((element) {
    //   log('Table: ${element.actualTableName}');
    // });

    log('Count: $count');
  }

  getCustomQuery() async {
    var data = await DbController.to.appDb
        .customSelectFuture('SELECT * FROM db_employees')
        .then((value) => value
            .map((e) => e.entries
                .map((e) => '${e.key}: ${e.value}')
                .toList()
                .join('\n'))
            .toList());

    log('Data: $data');

    // DbController.to.appDb
    //     .customSelectFuture('SELECT * FROM db_employees WHERE name = op');
  }

  ifSelectedMaster(String s) {
    return selectedMaster.contains(s);
  }
}
