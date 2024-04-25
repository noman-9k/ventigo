import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';
import 'package:ventigo/app/db/tables/tables.dart';

import '../../dialog/dialog_functions.dart';

class AddServiceController extends GetxController {
  // List<Category> categories = CategoryService.to.servicesCategories;

  TextEditingController serviceNameController = TextEditingController();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String? categoryName;

  List<DbCategories>? categories;

  @override
  Future<void> onReady() async {
    categories = await DbController.to.appDb
        .getAllCategories()
        .listen((event) {})
        .asFuture();

    update();
    super.onReady();
  }

  Future<String> getAllCategories() {
    List<String> categoryNames = [];

    var categories = DbController.to.appDb.getAllCategories().listen((event) {
      event.forEach((element) {
        categoryNames.add(element.name ?? '');
      });
    });
    return categories.asFuture();
  }

  // @override
  // void onClose() {
  //   removeAddNewCategory();

  //   super.onClose();
  // }

  addNewCategory() => pushAddNewCategoryDialog(Get.context!, (value) {
        if (value != null) {
          categoryNameController.text = value;
          update();
        }
      });

  resetCategoryName() {
    categoryName = null;
    categoryNameController.text = '';
    update();
  }

  onCategoryChanged(String? p1) {
    if (p1 == null) return;
    categoryName = p1;
    // if (p1.contains('Add New Category')) {}
  }

  // addService() {
  //   if (serviceNameController.text.isEmpty) {
  //     Get.snackbar('Error', 'Service Name is required');
  //     return;
  //   }
  //   if (categoryName.isEmpty) {
  //     Get.snackbar('Error', 'Category Name is required');
  //     return;
  //   }
  //   if (priceController.text.isEmpty) {
  //     Get.snackbar('Error', 'Price is required');
  //     return;
  //   }
  //   Get.focusScope?.unfocus();
  //   removeAddNewCategory();

  //   isCategoryExist(categoryName)
  //       ? addServiceToPreviousCategory(categoryName)
  //       : addNewCategoryAndService(categoryName);

  //   ServicesController.to.update();

  //   Get.back();
  // }

  // void addServiceToPreviousCategory(String categoryName) {
  //   var services = categories
  //       .firstWhere((element) => element.name == categoryName)
  //       .services;

  //   services?.add(AppService(
  //       name: serviceNameController.text,
  //       price: double.tryParse(priceController.text) ?? 0));
  // }

  // isCategoryExist(String categoryName) {
  //   return categories.any((element) => element.name == categoryName);
  // }

  // addNewCategoryAndService(String categoryName) {
  //   categories.add(Category(name: categoryName, services: [
  //     AppService(
  //         name: serviceNameController.text,
  //         price: double.tryParse(priceController.text) ?? 0)
  //   ]));
  // }

  void removeAddNewCategory() {
    // categories.removeWhere((element) => element.name == 'Add New Category');
  }

  Future<void> dbAddService() async {
    if (serviceNameController.text.isEmpty) {
      Get.snackbar('Error', 'Service Name is required');
      return;
    }
    if (categoryName == null && categoryNameController.text.isEmpty) {
      Get.snackbar('Error', 'Category Name is required');
      return;
    }

    if (priceController.text.isEmpty) {
      Get.snackbar('Error', 'Price is required');
      return;
    }

    Get.focusScope?.unfocus();

    int? categoryId = categoryNameController.text.isNotEmpty
        ? await _addNewCategory(categoryNameController.text)
        : await DbController.to.appDb.getCategoryId(categoryName!);

    await DbController.to.appDb.insertNewCompanionService(
        serviceNameController.text,
        double.tryParse(priceController.text) ?? 0,
        categoryId);

    Get.back();
  }

  Future<int> _addNewCategory(String name) async {
    try {
      return await DbController.to.appDb.insertNewCompanionCategory(name);
    } catch (e) {
      log('addNewCategory error: $e');
      return await DbController.to.appDb
          .insertNewCategory(DbCategory(name: name, id: 0));
    }
  }

  getAll() {
    log('getAll() Services');
    DbController.to.appDb.getAllServices().listen((event) {
      log(event.toString());
    });
    log('getAll() Categories');

    DbController.to.appDb.getAllCategories().listen((event) {
      log(event.toString());
    });
  }
}
