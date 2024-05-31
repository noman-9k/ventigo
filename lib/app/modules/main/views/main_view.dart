import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/modules/main/views/main_reports.dart';

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
      appBar: AppAppBar(title: 'Hello'),
      body: TwoTabsView(
        topCenterWidget: DateWidget(),
        onFilterPressed: (p0) {
          if (p0 == 0) Get.toNamed(Routes.COSTS_FILTER);
          if (p0 == 1) Get.toNamed(Routes.FILTERS);
        },
        showFilter: true,
        tabNames: ["Costs", "Reports"],
        widgets: [MainCostsView(), MainReportsView()],
      ),
      extendBody: true,
      // bottomNavigationBar: BottomAddLogoutBar(
      //   logout: () => controller.logout(),
      //   add: () => Get.toNamed(Routes.ADD_COST),
      // )
    );
  }
}
