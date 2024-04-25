import 'package:get/get.dart';

import '../modules/addCost/bindings/add_cost_binding.dart';
import '../modules/addCost/views/add_cost_view.dart';
import '../modules/addEmploye/bindings/add_employe_binding.dart';
import '../modules/addEmploye/views/add_employe_view.dart';
import '../modules/addReport/bindings/add_report_binding.dart';
import '../modules/addReport/views/add_report_view.dart';
import '../modules/addService/bindings/add_service_binding.dart';
import '../modules/addService/views/add_service_view.dart';
import '../modules/costsFilter/bindings/costs_filter_binding.dart';
import '../modules/costsFilter/views/costs_filter_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/employees/bindings/employees_binding.dart';
import '../modules/employees/views/employees_view.dart';
import '../modules/filters/bindings/filters_binding.dart';
import '../modules/filters/views/filters_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/services/bindings/services_binding.dart';
import '../modules/services/views/services_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/statistic/bindings/statistic_binding.dart';
import '../modules/statistic/views/statistic_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  // static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.ADD_REPORT,
      page: () => const AddReportView(),
      binding: AddReportBinding(),
    ),
    GetPage(
      name: _Paths.SERVICES,
      page: () => const ServicesView(),
      binding: ServicesBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SERVICE,
      page: () => const AddServiceView(),
      binding: AddServiceBinding(),
    ),
    GetPage(
      name: _Paths.STATISTIC,
      page: () => StatisticView(),
      binding: StatisticBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.FILTERS,
      page: () => const FiltersView(),
      binding: FiltersBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEES,
      page: () => const EmployeesView(),
      binding: EmployeesBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EMPLOYE,
      page: () => const AddEmployeeView(),
      binding: AddEmployeBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_COST,
      page: () => const AddCostView(),
      binding: AddCostBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.COSTS_FILTER,
      page: () => const CostsFilterView(),
      binding: CostsFilterBinding(),
    ),
  ];
}
