import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/app_services/employee_service.dart';
import 'package:ventigo/app/db/db_controller.dart';

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
    isLoading.value = true;
    int categoryId = selectedCategory!.id;
    int serviceId = selectedService!.id;
    int employeeId = EmployeeService.to.employee!.value.id;
    String name =
        nameController.text.trim() + ' ' + lastNameController.text.trim();
    String phone = phoneController.text.trim();
    // bool newCustomer = this.newCustomer ?? false;
    // bool regCustomer = this.regCustomer ?? false;
    // bool cardPay = this.cardPay ?? false;
    double price = double.parse(priceController.text.trim());

    log('Name: $name, Phone: $phone, EmployeeId: $employeeId, CategoryId: $categoryId, ServiceId: $serviceId, NewCustomer: $newCustomer, RegCustomer: $regCustomer, CardPay: $cardPay, Price: $price'
        .toString()
        .toUpperCase());

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
        DateTime.now(),
        cardPay ?? false,
        price,
        1);
    isLoading.value = false;

    log(DbController.to.appDb.getAllDataItems().toString());

    Get.back();
  }
}
