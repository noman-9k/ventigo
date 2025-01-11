import 'dart:developer';

import 'package:get/get.dart';
import 'package:ventigo/app/app_services/local_storage_service.dart';

import '../constants/app_constants.dart';
import '../db/db_controller.dart';

class DeleteExcessDataService extends GetxService {
  @override
  void onInit() {
    deleteExcessData();
    super.onInit();
  }

  Future<void> deleteExcessData() async {
    int? count = MySharedPref.getFromDisk('maxRows');

    int? costsCount = MySharedPref.getFromDisk(AppConstants.maxCosts);

    if (costsCount != null) {
      await deleteExcessCostsByNumberOfItemsToKeep(costsCount);
    }

    if (count != null) {
      await deleteExcessDataByNumberOfItemsToKeep(count);
    }
  }

  Future<int> getTotalDataCount() async {
    return await DbController.to.appDb.getTotalDataCount();
  }

  Future<void> deleteExcessDataByNumberOfItemsToKeep(int numberOfItemsToKeep) async {
    await DbController.to.appDb.deleteExcessDataByNumberOfItemsToKeep(numberOfItemsToKeep);
  }

  deleteExcessCostsByNumberOfItemsToKeep(int costsCount) {
    return DbController.to.appDb.deleteExcessCostsByNumberOfItemsToKeep(costsCount);
  }
}
