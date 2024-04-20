import 'package:get/get.dart';

import '../controllers/costs_filter_controller.dart';

class CostsFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CostsFilterController>(
      () => CostsFilterController(),
    );
  }
}
