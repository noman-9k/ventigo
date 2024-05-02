import 'dart:developer';

import '../../../config/app_enums.dart';
import '../../models/employee.dart';
import '../db_controller.dart';
import '../drift_db.dart';

class EmployeeConverter {
  Future<Employee> getEmployeeFromDb(DbEmployee dbEmployee) async {
    List<DbCategory>? categories;
    List<VisibilityFilter>? visibility;
    try {
      categories =
          await DbController.to.appDb.getCategoriesByIDs(dbEmployee.categories);
    } catch (e) {
      log('Error: $e');
    }
    try {
      visibility = getListsVisibility(dbEmployee.visibility);
    } catch (e) {
      log('Error Visibility: $e');
    }

    return Employee(
      id: dbEmployee.id,
      name: dbEmployee.name!,
      lastName: dbEmployee.lastName!,
      login: dbEmployee.login,
      password: dbEmployee.password,
      categories: categories,
      percentage: dbEmployee.percentage,
      visibility: visibility,
    );
  }

  List<VisibilityFilter>? getListsVisibility(List<String> visibility) {
    List<VisibilityFilter> visibilityList = [];
    visibility.forEach((element) {
      visibilityList.add(
          VisibilityFilter.values.firstWhere((e) => e.toString() == element));
    });
    return visibilityList;
  }
}
