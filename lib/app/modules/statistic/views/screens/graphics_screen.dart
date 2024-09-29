import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_text.dart';
import '../../../../../generated/l10n.dart';
import '../../controllers/statistic_controller.dart';
import 'graphs/tracker_chart_widget.dart';
import 'results/controler/new_statistics_results_controller.dart';

class GraphicsScreen extends GetView<StatisticController> {
  const GraphicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      NewStatisticsResultsController.to.clearFilters();
                    },
                    child: AppText.mediumBoldText(
                        S.of(context).clear + ' ' + S.of(context).filters,
                        color: Colors.red),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 220,
                      child: TrackerChart(
                        stream: controller.getReportsChartData(),
                        isCostsTable: false,
                      ),
                    ),
                    AppText.boldText(S.of(context).reportssalesTracker),
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
                    AppText.boldText(S.of(context).costsTracker),
                    10.verticalSpace,
                  ],
                ),
              ),
              90.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
