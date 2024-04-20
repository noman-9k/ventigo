import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/models/caregory.dart';
import 'package:ventigo/app/models/employee.dart';
import 'package:ventigo/app/models/service.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../dialog/dialog_functions.dart';

class FiltersController extends GetxController {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  List<Employee> mastersList = [
    Employee(name: 'John', lastName: 'Doe', login: 'john.doe'),
    Employee(name: 'Walker', lastName: 'Doe', login: 'john.doe'),
    Employee(name: 'bob', lastName: 'Doe', login: 'john.doe'),
    Employee(name: 'Walker2', lastName: 'Doe', login: 'john.doe'),
    Employee(name: 'bob3', lastName: 'Doe', login: 'john.doe')
  ];

  List<Category> categoriesList = CategoryService.to.getAllServicesCategories();
  List<AppService> servicesList = CategoryService.to.getAllServices();

  List<Employee> selectedMaster = [];
  List<Category> selectedCategories = [];
  List<AppService> selectedServices = [];

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
