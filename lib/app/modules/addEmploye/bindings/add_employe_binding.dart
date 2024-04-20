import 'package:get/get.dart';

import '../controllers/add_employe_controller.dart';

class AddEmployeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEmployeeController>(
      () => AddEmployeeController(),
    );
  }
}
