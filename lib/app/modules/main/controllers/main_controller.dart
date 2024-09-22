import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';
import 'package:ventigo/app/modules/dialog/dialog_functions.dart';

import '../../../routes/app_pages.dart';
import '../../filters/db_filter/user_data_filter.dart';
import '../../statistic/controllers/table_data.dart';

class MainController extends GetxController {
  List<TableItem> tableItems = [];

  static MainController get to => Get.find();
  Stream<List<DbDataItem>> currentStream = DbController.to.appDb.getAllDataItems();

  getFilteredDataItems({UserDataFilter? filter}) {
    if (filter == null) {
      currentStream = DbController.to.appDb.getAllDataItems();
    } else {
      currentStream = DbController.to.appDb.getFilteredDataItems(filter);
    }
    update();
  }

  void logout() {
    Get.offAllNamed(Routes.LOGIN);
  }

  deleteItem(BuildContext context, int id) {
    pushConfirmDialog(context, title: 'Delete Item', message: 'Are you sure you want to delete this item?', onDone: () {
      DbController.to.appDb.deleteDataItem(id);
      update();
    });
  }

  editItem(DbDataItem tableItem) {
    Get.toNamed(Routes.EDIT_REPORT, arguments: tableItem);
  }
}
