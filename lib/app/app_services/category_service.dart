import 'package:get/get.dart';
import 'package:ventigo/app/app_services/employee_service.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';

class CategoryService extends GetxService {
  static CategoryService get to => Get.find();

  RxList<DbCategory> servicesCategories = <DbCategory>[].obs;

  Future<List<DbCategory>> getAllServicesCategories() async {
    return await DbController.to.appDb.getCategoriesAsList();
  }

  Future<int> getCategoriesCount() async {
    return await DbController.to.appDb.getCategoriesCount();
  }

  List<DbCategory> getEmployeeCategories() {
    // var employeeCategories;
    // employeeCategories = await DbController.to.appDb
    //     .getCategoriesByIDs(EmployeeService.to.employee!.value.categories);
    return EmployeeService.to.employee!.value.categories ?? [];
  }

  Stream<List<DbService>>? getServicesByCategory(int? categoryId) {
    return categoryId == null
        ? null
        : DbController.to.appDb.getServicesByCategory(categoryId);
  }
}
