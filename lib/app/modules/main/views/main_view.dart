import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/modules/main/views/main_reports.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text.dart';
import '../../../../generated/l10n.dart';
import '../../../routes/app_pages.dart';
import '../../common/app_app_bar.dart';
import '../../common/date_widget.dart';
import '../../common/two_tabs_view.dart';
import '../controllers/main_controller.dart';
import 'main_costs.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppAppBar(title: S.of(context).hello),
      body: TwoTabsView(
        topCenterWidget: DateWidget(),
        onFilterPressed: (p0) {
          if (p0 == 0) Get.toNamed(Routes.COSTS_FILTER);
          if (p0 == 1) Get.toNamed(Routes.FILTERS);
        },
        showFilter: true,
        tabNames: [S.of(context).costs, S.of(context).reports],
        widgets: [MainCostsView(), MainReportsView()],
      ),
      // floatingActionButton: Padding(
      //     padding: const EdgeInsets.only(bottom: 50),
      //     child: FloatingActionButton.extended(
      //       hoverColor: Colors.white,
      //       splashColor: AppColors.whiteColor,
      //       focusColor: Colors.white,
      //       hoverElevation: 0,
      //       foregroundColor: Colors.white,
      //       onPressed: () {
      //         // NewStatisticsResultsController.to.clearFilters();
      //       },
      //       backgroundColor: Colors.transparent,
      //       elevation: 0,
      //       label: AppText.mediumBoldText(
      //           S.of(context).clear + ' ' + S.of(context).filters,
      //           color: Colors.red),
      //     )),
      extendBody: true,
    );
  }
}
