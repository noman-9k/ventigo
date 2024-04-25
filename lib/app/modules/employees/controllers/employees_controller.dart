import 'dart:developer';

import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/db_converter/employee_converter.dart';
import 'package:ventigo/app/db/drift_db.dart';
import 'package:ventigo/app/models/employee.dart';
import 'package:ventigo/app/routes/app_pages.dart';

class EmployeesController extends GetxController {
  static EmployeesController get to => Get.find();

  Stream<List<DbEmployee>> fetchEmploys() {
    return DbController.to.appDb.getAllEmployees();
  }

  Future<List<EmployeeSearchItem>> getEmployeesSearchList() async {
    var fetchEmploys = await DbController.to.appDb.getAllEmployeesList();

    return await fetchEmploys
        .map((e) => EmployeeSearchItem(label: e.name!, value: e))
        .toList();
  }

  fetchDataAsString() async {
    fetchEmploys().listen((event) {
      event.forEach((element) {
        print('Employee: ${element.name}');
      });
    });

    return fetchEmploys();
  }

  scrollToValue(value) {
    print(value);
  }

  viewEmployee(DbEmployee employee) async {
    Get.toNamed(Routes.ADD_EMPLOYE, arguments: employee);
  }
}

class EmployeeSearchItem {
  String label;
  DbEmployee value;
  EmployeeSearchItem({required this.label, required this.value});

  factory EmployeeSearchItem.fromJson(Map<String, dynamic> json) {
    return EmployeeSearchItem(label: json['label'], value: json['value']);
  }
}
