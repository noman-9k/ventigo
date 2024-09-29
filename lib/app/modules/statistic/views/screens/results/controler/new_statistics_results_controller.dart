import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../../../db/db_controller.dart';
import '../../../../../../models/stats_result_model.dart';

class NewStatisticsResultsController extends GetxController {
  static NewStatisticsResultsController get to => Get.find<NewStatisticsResultsController>();

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
    if (fromDate != null) {
      this.fromDate = fromDate.obs;
      fromDateController.text = fromDate.smallDate();
    } else {
      this.toDate = toDate.obs;
      if (toDate != null) toDateController.text = toDate.smallDate();
    }

    update();
  }

  getFilteredStream() {
    filterFuture = DbController.to.appDb.getNewStatisticsReports(fromDate: fromDate?.value, toDate: toDate?.value);

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

  void selectDateRange(BuildContext context) {
    showDateRangePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(3000)).then((value) {
      if (value != null) {
        fromDate = value.start.obs;
        toDate = value.end.add(const Duration(days: 1)).subtract(const Duration(minutes: 1)).obs;
        fromDateController.text = fromDate!.value!.smallDate();
        toDateController.text = toDate!.value!.smallDate();
      }
    });
  }
}
