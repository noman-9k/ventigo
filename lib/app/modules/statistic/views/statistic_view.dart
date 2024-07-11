import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ventigo/config/app_colors.dart';

import '../../../../config/app_text.dart';
import '../../../../generated/l10n.dart';
import '../../common/app_app_bar.dart';
import '../../common/date_widget.dart';
import '../../common/two_tabs_view.dart';
import '../controllers/statistic_controller.dart';
import 'screens/graphics_screen.dart';
import 'screens/results/controler/new_statistics_results_controller.dart';
import 'screens/results/results_screen.dart';

class StatisticsView extends GetView<StatisticController> {
  const StatisticsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: S.of(context).hello),
      // floatingActionButton: Padding(
      //     padding: const EdgeInsets.only(bottom: 50),
      //     child: FloatingActionButton.extended(
      //       hoverColor: Colors.white,
      //       splashColor: AppColors.whiteColor,
      //       focusColor: Colors.white,
      //       hoverElevation: 0,
      //       foregroundColor: Colors.white,
      //       onPressed: () {
      //         NewStatisticsResultsController.to.clearFilters();
      //       },
      //       backgroundColor: Colors.transparent,
      //       elevation: 0,
      //       label: AppText.mediumBoldText(
      //           S.of(context).clear + ' ' + S.of(context).filters,
      //           color: Colors.red),
      //     )),
      body: GetBuilder<NewStatisticsResultsController>(builder: (controller) {
        return TwoTabsView(
          topCenterWidget: DateWidget(),
          tabNames: [S.of(context).graphics, S.of(context).results],
          widgets: [GraphicsScreen(), ResultsScreen()],
        );
      }),
    );
  }
}
