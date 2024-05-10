import 'package:get/get.dart';
import 'package:ventigo/app/app_services/employee_service.dart';

import 'app/app_services/category_service.dart';
import 'app/db/db_controller.dart';
import 'app/modules/splash/controllers/splash_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<DbController>(DbController());

    // services
    Get.lazyPut<EmployeeService>(() => EmployeeService());
    Get.lazyPut<CategoryService>(() => CategoryService());
  }
}
