import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';

import '../../../../../config/app_text.dart';
import '../../controllers/statistic_controller.dart';
import 'graphs/tracker_chart_widget.dart';

class GraphicsScreen extends GetView<StatisticController> {
  const GraphicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  10.verticalSpace,
                  SizedBox(
                    height: 220,
                    child: TrackerChart(
                      stream: controller.getReportsChartData(),
                      isCostsTable: false,
                    ),
                  ),
                  AppText.boldText('Reports/Sales Tracker'),
                  10.verticalSpace,
                ],
              ),
            ),
            20.verticalSpace,
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  10.verticalSpace,
                  SizedBox(
                    height: 220,
                    child: TrackerChart(
                      stream: controller.getCostsChartData(),
                      isCostsTable: true,
                    ),
                  ),
                  AppText.boldText('Costs Tracker'),
                  10.verticalSpace,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
