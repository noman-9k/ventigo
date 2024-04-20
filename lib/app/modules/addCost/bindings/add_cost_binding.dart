import 'package:get/get.dart';

import '../controllers/add_cost_controller.dart';

class AddCostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCostController>(
      () => AddCostController(),
    );
  }
}
