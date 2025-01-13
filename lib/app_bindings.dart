import 'package:get/get.dart';
import 'package:ventigo/app/app_services/delete_excess_data_service.dart';
import 'package:ventigo/app/app_services/employee_service.dart';

import 'app/app_services/category_service.dart';
import 'app/db/db_controller.dart';
import 'app/modules/splash/controllers/splash_controller.dart';
import 'app/app_services/purchase_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<DbController>(DbController(), permanent: true);

    // services
    Get.lazyPut<EmployeeService>(() => EmployeeService());
    Get.lazyPut<CategoryService>(() => CategoryService());
    Get.lazyPut<PurchaseService>(() => PurchaseService());

    Get.put<DeleteExcessDataService>(DeleteExcessDataService());
  }
}
