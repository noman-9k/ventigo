import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/app_services/employee_service.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/extensions/date_extension.dart';

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
      list.add(SearchItem(label: element.name!, value: element.id.toString()));
    });

    return list;
  }

  Future<List> fetchDataPhone() async {
    List<SearchItem> list = [];

    List<DbDataItem> dataItems = await DbController.to.appDb.getAllDataItemsF();

    dataItems.forEach((element) {
      list.add(
          SearchItem(label: element.phone ?? "", value: element.id.toString()));
    });

    return list;
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
    log('Search item changed');
    log('Value: ${value.value}');
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
}
