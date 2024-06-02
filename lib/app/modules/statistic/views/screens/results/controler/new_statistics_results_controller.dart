import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../../../db/db_controller.dart';
import '../../../../../../models/stats_result_model.dart';

class NewStatisticsResultsController extends GetxController {
  Rx<DateTime?>? fromDate;
  Rx<DateTime?>? toDate;

  RxBool isBottomSheetOpen = false.obs;
  Future<List<StatResultModel>>? filterFuture;

  TextEditingController toDateController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();

  @override
  void onInit() {
    filterFuture = DbController.to.appDb.getNewStatisticsReports();
    super.onInit();
  }

  void changeBottomSheet({bool value = false}) {
    isBottomSheetOpen.value = value;
  }

  updateDate({DateTime? fromDate, DateTime? toDate}) {
    this.fromDate = fromDate.obs;
    this.toDate = toDate.obs;

    if (fromDate != null) fromDateController.text = fromDate.smallDate();
    if (toDate != null) toDateController.text = toDate.smallDate();

    update();
  }

  getFilteredStream() {
    log('fromDate: ${this.fromDate?.value}');
    log('toDate: ${this.toDate?.value}');

    filterFuture = DbController.to.appDb.getNewStatisticsReports(
        fromDate: fromDate?.value, toDate: toDate?.value);

    update();
  }

  void clearFilters() {
    fromDateController.clear();
    toDateController.clear();
    fromDate = null;
    toDate = null;
    filterFuture = DbController.to.appDb.getNewStatisticsReports();
    update();
  }
}
