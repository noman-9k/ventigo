import 'package:get/get.dart';
import 'package:ventigo/app/app_services/employee_service.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';

class UserDataController extends GetxController {
  // List<DbDataItem> currentI = [];

  static UserDataController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  Stream<List<DbDataItem>> getAllDataItems() {
    return DbController.to.appDb
        .getAllDataItemsByEmployeeId(EmployeeService.to.employee!.value.id);
  }

  logout() {}
}
