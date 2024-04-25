import 'package:get/get.dart';

import 'app/app_services/category_service.dart';
import 'app/db/db_controller.dart';
import 'app/modules/splash/controllers/splash_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<DbController>(DbController());

    Get.lazyPut<CategoryService>(() => CategoryService());
  }
}
