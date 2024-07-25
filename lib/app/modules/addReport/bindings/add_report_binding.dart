import 'package:get/get.dart';

import '../controllers/add_report_controller.dart';

class AddReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddReportController>(() => AddReportController());
    Get.lazyPut<YesNoButtonController>(() => YesNoButtonController());
  }
}
