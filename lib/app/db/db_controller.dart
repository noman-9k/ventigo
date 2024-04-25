import 'dart:developer';

import 'package:get/get.dart';

import 'drift_db.dart';

class DbController extends GetxController {
  static DbController get to => Get.find();
  late final AppDb _appDb;

  AppDb get appDb => _appDb;

  @override
  void onInit() {
    super.onInit();

    log('DbController.onInit()');
    _appDb = AppDb();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
