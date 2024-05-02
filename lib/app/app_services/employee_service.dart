import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/db_converter/employee_converter.dart';
import 'package:ventigo/app/models/employee.dart';

class EmployeeService extends GetxService {
  static EmployeeService get to => Get.find();

  Rx<Employee>? employee;

  Future<Employee?> employeeLogin(String login, String password) async {
    var dbEmployee =
        await DbController.to.appDb.getEmployeeByLoginPassword(login, password);

    if (dbEmployee == null) return null;

    Employee emp = await EmployeeConverter().getEmployeeFromDb(dbEmployee);
    setEmployee(emp);

    return emp;
  }

  setEmployee(Employee emp) {
    employee = emp.obs;
  }
}
