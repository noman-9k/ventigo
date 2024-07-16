import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/app_services/employee_service.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/extensions/date_extension.dart';
import 'package:ventigo/extensions/list_extension.dart';

import '../../../db/drift_db.dart';

class AddReportController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  bool? newCustomer;
  bool? regCustomer;
  bool? cardPay;
  RxBool isLoading = false.obs;

  List<DbCategory> categories = [];
  List<DbService> services = [];

  DbCategory? selectedCategory;
  DbService? selectedService;

  @override
  void onInit() {
    categories = CategoryService.to.getEmployeeCategories();

    update();
    super.onInit();
  }

  Future<List> fetchDataName() async {
    List<SearchItem> list = [];

    List<DbDataItem> dataItems = await DbController.to.appDb.getAllDataItemsF();

    dataItems.forEach((element) {
      list.add(SearchItem(
          label: element.name!.replaceAll('\n', ' - '),
          value: element.id.toString()));
    });

    return list.myDistinct();
  }

  Future<List> fetchDataPhone() async {
    List<SearchItem> list = [];

    List<DbDataItem> dataItems = await DbController.to.appDb.getAllDataItemsF();

    dataItems.forEach((element) {
      list.add(
          SearchItem(label: element.phone ?? "", value: element.id.toString()));
    });

    return list.myDistinct();
  }

  onCategoryChanged(String? p1) {
    selectedCategory = null;
    update();
    selectedCategory = categories.firstWhere((element) => element.name == p1);
    update();
  }

  onServiceChanged(DbService p1) {
    selectedService = p1;
    log('Service changed');
    update();
  }

  Future<void> submit() async {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Name is required');
      return;
    }
    if (phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Phone is required');
      return;
    }
    if (priceController.text.isEmpty) {
      Get.snackbar('Error', 'Price is required');
      return;
    }
    if (selectedCategory == null) {
      Get.snackbar('Error', 'Please Select a category');
      return;
    }
    if (selectedService == null) {
      Get.snackbar('Error', 'Please Select a service');
      return;
    }

    final total = await DbController.to.appDb
            .getTodayTotalByEmployeeId(EmployeeService.to.employee!.value.id) ??
        0.0;

    isLoading.value = true;
    int categoryId = selectedCategory!.id;
    int serviceId = selectedService!.id;
    int employeeId = EmployeeService.to.employee!.value.id;
    String name =
        nameController.text.trim() + '\n' + lastNameController.text.trim();
    String phone = phoneController.text.trim();

    double price = double.parse(priceController.text.trim());

    await DbController.to.appDb.insertNewCompanionDataItem(
        name,
        phone,
        employeeId,
        EmployeeService.to.employee!.value.name,
        categoryId,
        selectedCategory?.name ?? 'No category',
        serviceId,
        selectedService?.name ?? 'No service',
        newCustomer ?? false,
        regCustomer ?? false,
        DateTime.now().add(Duration(days: 0)).onlyDate(),
        cardPay ?? false,
        price,
        (total + price),
        EmployeeService.to.employee!.value.percentage ?? 0.0);

    isLoading.value = false;

    Get.back();
  }

  onSearchItemChanged(SearchItem value) async {
    log('onSearchItemChanged' + value.toString());

    int? itemId = int.tryParse(value.value);
    if (itemId == null) {
      return;
    }

    DbDataItem dataItems = await DbController.to.appDb.getDataItemById(itemId);

    nameController.text = dataItems.name?.split('\n').first ?? "";
    phoneController.text = dataItems.phone ?? "";
    lastNameController.text = dataItems.name?.split('\n').last ?? "";
  }
}

class SearchItem {
  String label;
  String value;
  SearchItem({required this.label, required this.value});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(label: json['label'], value: json['value']);
  }

  @override
  String toString() {
    return 'SearchItem{label: $label, value: $value}';
  }

  @override
  bool operator ==(Object other) {
    // if (identical(this, other)) return true;

    return other is SearchItem && other.label == label;
  }
}
