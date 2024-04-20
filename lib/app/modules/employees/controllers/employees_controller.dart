import 'package:get/get.dart';
import 'package:ventigo/app/models/employee.dart';

class EmployeesController extends GetxController {
  static EmployeesController get to => Get.find();

  List<Employee> employees = [
    Employee(name: 'John', lastName: 'Doe', login: 'john.doe'),
    Employee(name: 'Walker', lastName: 'Doe', login: 'john.doe'),
    Employee(name: 'bob', lastName: 'Doe', login: 'john.doe'),
    Employee(name: 'Walker2', lastName: 'Doe', login: 'john.doe'),
    Employee(name: 'bob3', lastName: 'Doe', login: 'john.doe'),
  ];

  List<EmployeeSearchItem> getEmployeesList() {
    return employees
        .map((e) => EmployeeSearchItem(label: e.name, value: e))
        .toList();
  }

  fetchData() async {
    return getEmployeesList();
  }

  scrollToValue(value) {
    print(value);
  }
}

class EmployeeSearchItem {
  String label;
  Employee value;
  EmployeeSearchItem({required this.label, required this.value});

  factory EmployeeSearchItem.fromJson(Map<String, dynamic> json) {
    return EmployeeSearchItem(label: json['label'], value: json['value']);
  }
}
