import 'package:get/get.dart';

import '../controllers/services_controller.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ServicesController>(
      ServicesController(),
    );
  }
}
