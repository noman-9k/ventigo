import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/statistic/controllers/statistic_controller.dart';

import '../../../../common/date_widget.dart';
import '../../../../common/two_tabs_view.dart';
import 'new_statistics_results.dart';
import 'statistic_cost_screen.dart';
import 'statistic_report_screen.dart';

class ResultsScreen extends GetView<StatisticController> {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NewStatisticsResults();
    // // return StatisticReportScreen();
    // TwoTabsView(
    //   isSmall: true,
    //   tabNames: ["Costs", "Reports"],
    //   // topCenterWidget: kDebugMode
    //   //     ? IconButton(
    //   //         onPressed: () => controller.reportsData(), icon: Icon(Icons.abc))
    //   //     : null,
    //   widgets: [StatisticCostScreen(), StatisticReportScreen()],
    // );
  }
}
