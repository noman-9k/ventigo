import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/modules/costsFilter/controllers/costs_filter_controller.dart';
import 'package:ventigo/app/modules/employees/controllers/employees_controller.dart';
import 'package:ventigo/app/modules/filters/controllers/filters_controller.dart';
import 'package:ventigo/app/modules/services/controllers/services_controller.dart';
import 'package:ventigo/app/modules/settings/controllers/settings_controller.dart';
import 'package:ventigo/app/modules/main/controllers/main_controller.dart';
import 'package:ventigo/app/modules/statistic/controllers/statistic_controller.dart';

import '../../statistic/views/screens/results/controler/new_statistics_results_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.put<ServicesController>(ServicesController());
    Get.lazyPut<FiltersController>(() => FiltersController());
    Get.put<StatisticController>(StatisticController());
    Get.lazyPut<EmployeesController>(() => EmployeesController());
    Get.put<SettingsController>(SettingsController());
    Get.put<CostsFilterController>(CostsFilterController());
    Get.put<MainController>(MainController());
    Get.put<NewStatisticsResultsController>(NewStatisticsResultsController());

    Get.put<FiltersController>(FiltersController(), permanent: true);
    Get.put<CostsFilterController>(CostsFilterController(), permanent: true);

    /// Services
    ///
    Get.lazyPut<CategoryService>(() => CategoryService());
  }
}
