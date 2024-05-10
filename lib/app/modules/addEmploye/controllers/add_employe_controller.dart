import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/db/db_controller.dart';

import '../../../../config/app_enums.dart';
import '../../../db/db_converter/employee_converter.dart';
import '../../../db/drift_db.dart';
import '../../dialog/dialog_functions.dart';

class AddEmployeeController extends GetxController {
  List<DbCategory> selectedCategories = [];

  TextEditingController categoriesController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  RxBool isEdit = false.obs;

  List<VisibilityFilter> trueFilters = [];

  @override
  Future<void> onReady() async {
    if (Get.arguments != null) {
      DbEmployee dbEmployee = Get.arguments;
      isEdit.value = true;

      var employee = await EmployeeConverter().getEmployeeFromDb(dbEmployee);

      nameController.text = employee.name;
      lastNameController.text = employee.lastName;
      loginController.text = employee.login ?? '';
      passController.text = employee.password ?? '';
      percentageController.text = employee.percentage.toString();
      selectedCategories = employee.categories ?? [];
      categoriesController.text =
          selectedCategories.map((e) => e.name).join(', ');
      trueFilters = employee.visibility ?? [];

      update();
    }

    super.onReady();
  }

  onVisibilityFilterChange(VisibilityFilter filter, bool value) {
    if (value) {
      if (!trueFilters.contains(filter)) {
        trueFilters.add(filter);
      }
    } else {
      trueFilters.remove(filter);
    }
    update();
  }

  categoryTab(BuildContext context) async {
    pushCategorySelectDialog(
      context,
      categories: await CategoryService.to.getAllServicesCategories(),
      selectedCategories: selectedCategories,
      onDone: (categories) {
        selectedCategories = categories ?? [];
        categoriesController.text =
            selectedCategories.map((e) => e.name).join(', ');

        update();
      },
    );
  }

  saveEmployee() {
    if (isEdit.value) {
      DbController.to.appDb.updateEmployee(
        DbEmployee(
          id: Get.arguments.id,
          name: nameController.text,
          lastName: lastNameController.text,
          login: loginController.text,
          password: passController.text,
          percentage: double.parse(percentageController.text),
          categories: selectedCategories.map((e) => e.id.toString()).toList(),
          visibility: trueFilters.map((e) => e.toString()).toList(),
        ),
      );
      Get.back();
      return;
    }

    List<String> categoryIds = [];

    categoryIds = selectedCategories.map((e) => e.id.toString()).toList();
    log('categoryIds: $categoryIds');

    DbController.to.appDb.insertNewCompanionEmployee(
      nameController.text,
      lastNameController.text,
      loginController.text,
      passController.text,
      double.parse(percentageController.text),
      categories: categoryIds,
      visibility: trueFilters.map((e) => e.toString()).toList(),
    );
    Get.back();
  }
}
