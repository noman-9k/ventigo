import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/models/service.dart';
import 'package:ventigo/app/modules/services/controllers/services_controller.dart';

import '../../../models/caregory.dart';
import '../../dialog/dialog_functions.dart';

class AddServiceController extends GetxController {
  List<Category> categories = CategoryService.to.servicesCategories;

  TextEditingController serviceNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String categoryName = '';

  @override
  void onReady() {
    categories.add(Category(name: 'Add New Category', services: []));
    update();
    super.onReady();
  }

  @override
  void onClose() {
    removeAddNewCategory();

    super.onClose();
  }

  onCategoryChanged(String? p1) {
    if (p1 == null) return;
    categoryName = p1;
    if (p1.contains('Add New Category')) {
      pushAddNewCategoryDialog(Get.context!, (value) {
        if (value != null) {
          categoryName = value;
        }
      });
      ;
    }
  }

  addService() {
    if (serviceNameController.text.isEmpty) {
      Get.snackbar('Error', 'Service Name is required');
      return;
    }
    if (categoryName.isEmpty) {
      Get.snackbar('Error', 'Category Name is required');
      return;
    }
    if (priceController.text.isEmpty) {
      Get.snackbar('Error', 'Price is required');
      return;
    }
    Get.focusScope?.unfocus();
    removeAddNewCategory();

    isCategoryExist(categoryName)
        ? addServiceToPreviousCategory(categoryName)
        : addNewCategoryAndService(categoryName);

    ServicesController.to.update();

    Get.back();
  }

  void addServiceToPreviousCategory(String categoryName) {
    var services = categories
        .firstWhere((element) => element.name == categoryName)
        .services;

    services?.add(AppService(
        name: serviceNameController.text,
        price: double.tryParse(priceController.text) ?? 0));
  }

  isCategoryExist(String categoryName) {
    return categories.any((element) => element.name == categoryName);
  }

  addNewCategoryAndService(String categoryName) {
    categories.add(Category(name: categoryName, services: [
      AppService(
          name: serviceNameController.text,
          price: double.tryParse(priceController.text) ?? 0)
    ]));
  }

  void removeAddNewCategory() {
    categories.removeWhere((element) => element.name == 'Add New Category');
  }
}
