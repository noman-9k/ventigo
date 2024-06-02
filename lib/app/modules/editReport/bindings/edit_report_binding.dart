import 'package:get/get.dart';

import '../controllers/edit_report_controller.dart';

class EditReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditReportController>(
      () => EditReportController(),
    );
  }
}
