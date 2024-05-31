import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';

import '../../../routes/app_pages.dart';
import '../../filters/db_filter/user_data_filter.dart';
import '../../statistic/controllers/table_data.dart';

class MainController extends GetxController {
  List<TableItem> tableItems = [];

  static MainController get to => Get.find();
  Stream<List<DbDataItem>> currentStream =
      DbController.to.appDb.getAllDataItems();

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
}
