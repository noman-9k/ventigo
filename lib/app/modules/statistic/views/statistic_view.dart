import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../common/app_app_bar.dart';
import '../../common/date_widget.dart';
import '../../common/two_tabs_view.dart';
import '../controllers/statistic_controller.dart';
import 'screens/costs_screen.dart';
import 'screens/reports_screen.dart';

class StatisticsView extends GetView<StatisticController> {
  const StatisticsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: 'Hello, Walker!',
      ),
      body: TwoTabsView(
        topCenterWidget: DateWidget(),
        tabNames: ["Costs", "Reports"],
        widgets: [
          // Center(child: AppText.lightText('Costs')),
          CostsScreen(),
          ReportsScreen(),
          // Center(child: AppText.lightText('Reports')),
        ],
      ),
    );
  }
}
