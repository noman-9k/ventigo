import 'package:drift/drift.dart';
import 'package:get/get.dart';

import 'drift_db.dart';

class DbController extends GetxController {
  static DbController get to => Get.find();
  late final AppDb _appDb;

  AppDb get appDb => _appDb;

  @override
  void onInit() {
    super.onInit();

    _appDb = AppDb();
  }

  Iterable<TableInfo<Table, dynamic>> get tables => _appDb.allTables;

  @override
  void onClose() {
    super.onClose();
  }
}
