import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/modules/common/two_tabs_view.dart';
import 'package:ventigo/config/app_text.dart';

import '../controllers/statistic_controller.dart';

class StatisticView extends GetView<StatisticController> {
  StatisticView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TwoTabsView(
        tabNames: ["Results", "Graphics"],
        widgets: [
          Center(child: AppText.lightText('Results')),
          Center(child: AppText.lightText('Graphics')),
        ],
      ),
    );
  }
}
