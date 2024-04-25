import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/models/caregory.dart';

import '../../../db/drift_db.dart';
import '../../dialog/dialog_functions.dart';

class AddEmployeeController extends GetxController {
  List<Category> selectedCategories = [];

  categoryTab(BuildContext context) {
    pushCategorySelectDialog(
      context,
      categories: CategoryService.to.servicesCategories,
      selectedCategories: selectedCategories,
      onDone: (categories) {
        selectedCategories = categories ?? [];
        update();
      },
    );
  }

  getAllEmployees() {
    DbController.to.appDb.getAllEmployees().listen((event) {
      log('getAllEmployees()');
      event.forEach((element) {
        log('Employee: ${element.name}');
      });
    });
  }

  saveEmployee() {
    DbController.to.appDb
        .insertNewEmployee(DbEmployee(
      id: 1,
      name: 'name',
      lastName: 'lastName',
      login: 'login',
      password: 'password',
      percentage: 0.0,
    ))
        .then((value) {
      log('Employee added');
    });
  }
}
