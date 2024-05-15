import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/db_converter/employee_converter.dart';
import 'package:ventigo/app/db/drift_db.dart';
import 'package:ventigo/app/models/employee.dart';

class EmployeeService extends GetxService {
  static EmployeeService get to => Get.find();

  Rx<Employee>? employee;

  List<Employee> allEmployees = [];

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<DbEmployee>> getAll() async {
    return await DbController.to.appDb.getAllEmployeesList();
  }

  Future<Employee?> employeeLogin(String login, String password) async {
    var dbEmployee =
        await DbController.to.appDb.getEmployeeByLoginPassword(login, password);

    if (dbEmployee == null) return null;

    Employee emp = await EmployeeConverter().getEmployeeFromDb(dbEmployee);
    setEmployee(emp);

    return emp;
  }

  double? getEmployeePercentageOf(double? value) {
    return value?.percentage(employee!.value.percentage);
  }

  setEmployee(Employee emp) {
    employee = emp.obs;
  }
}

// extension on double to get percentage of value
extension Percentage on double {
  double? percentage(double? value) {
    return this * (value ?? 1) / 100;
  }
}
