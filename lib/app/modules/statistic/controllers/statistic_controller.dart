import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  var selectedTab;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  ///
  ///
  ///
  ///
  ///
}
