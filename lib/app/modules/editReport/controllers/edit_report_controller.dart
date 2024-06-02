import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../db/db_controller.dart';
import '../../../db/drift_db.dart';

class EditReportController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  bool? newCustomer;
  bool? regCustomer;
  bool? cardPay;
  RxBool isLoading = false.obs;

  List<DbCategory>? categories = [];
  List<DbService> services = [];

  DbCategory? selectedCategory;
  DbService? selectedService;

  @override
  Future<void> onInit() async {
    DbDataItem item = Get.arguments;

    categories =
        await DbController.to.appDb.getCategoryByEmpId(item.employeeId);
    services =
        await DbController.to.appDb.getServicesByCategoryId(item.categoryId);

    nameController.text = item.name?.split('').first ?? '';
    lastNameController.text = item.name?.split('').last ?? '';
    phoneController.text = item.phone ?? '';
    priceController.text = item.price.toString();
    newCustomer = item.newCustomer;
    regCustomer = item.regCustomer;
    cardPay = item.cardPay;

    update();
    super.onInit();
  }

  onCategoryChanged(String? p1) {
    selectedCategory = null;
    update();
    selectedCategory = categories?.firstWhere((element) => element.name == p1);
    update();
  }

  onServiceChanged(DbService p1) {
    selectedService = p1;
    update();
  }

  void editReport() {
    if (nameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        priceController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    isLoading.value = true;

    DbDataItem item = Get.arguments;

    DbDataItem newItem = DbDataItem(
      id: item.id,
      name: nameController.text + ' ' + lastNameController.text,
      phone: phoneController.text,
      price: double.parse(priceController.text),
      newCustomer: newCustomer ?? item.newCustomer,
      regCustomer: regCustomer ?? item.regCustomer,
      cardPay: cardPay ?? item.cardPay,
      employeeId: item.employeeId,
      categoryId: selectedCategory?.id ?? item.categoryId,
      serviceId: selectedService?.id ?? item.serviceId,
      categoryName: selectedCategory?.name ?? item.categoryName,
      serviceName: selectedService?.name ?? item.serviceName,
      employeeName: item.employeeName,
      percentage: item.percentage,
      total: ((item.total ?? 0.0) - (item.price ?? 0.0)) +
          double.parse(priceController.text),
      date: item.date,
    );

    DbController.to.appDb.updateDataItem(newItem);
    isLoading.value = false;
    Get.back();
  }
}
