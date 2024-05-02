import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/modules/employees/controllers/employees_controller.dart';
import 'package:ventigo/app/modules/statistic/controllers/statistic_controller.dart';
import 'package:ventigo/app/modules/services/controllers/services_controller.dart';
import 'package:ventigo/app/modules/settings/controllers/settings_controller.dart';
import 'package:ventigo/app/modules/main/controllers/main_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    // Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<ServicesController>(() => ServicesController());
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<EmployeesController>(() => EmployeesController());
    Get.lazyPut<SettingsController>(() => SettingsController());

    /// Services
    ///
    Get.lazyPut<CategoryService>(() => CategoryService());
  }
}
