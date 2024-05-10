import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app_services/employee_service.dart';
import '../../common/app_app_bar.dart';
import '../../common/date_widget.dart';
import '../../common/two_tabs_view.dart';
import '../controllers/statistic_controller.dart';
import 'screens/graphics_screen.dart';
import 'screens/results_screen.dart';

class StatisticsView extends GetView<StatisticController> {
  const StatisticsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
          title: 'Hello, ' +
              (EmployeeService.to.employee?.value.name ?? 'Walker!')),
      body: TwoTabsView(
        topCenterWidget: DateWidget(),
        tabNames: ["Graphics", "Results"],
        widgets: [GraphicsScreen(), ResultsScreen()],
      ),
    );
  }
}
