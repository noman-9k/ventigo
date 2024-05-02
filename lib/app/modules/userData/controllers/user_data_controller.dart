import 'dart:math';

import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';

import '../../../models/caregory.dart';
import '../../../models/service.dart';
import '../../statistic/controllers/table_data.dart';

class UserDataController extends GetxController {
  // List<DbDataItem> currentI = [];

  static UserDataController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  Stream<List<DbDataItem>> getAllDataItems() {
    return DbController.to.appDb.getAllDataItems();
  }

  logout() {}
}
