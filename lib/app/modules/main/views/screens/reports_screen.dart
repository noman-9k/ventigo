import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../common/bottom_add_logout_bar.dart';
import '../../../statistic/controllers/statistic_controller.dart';
import '../../../statistic/views/widgets/horizental_data_table.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddLogoutBar(
        logout: () => Get.toNamed(Routes.LOGIN),
        add: () => Get.toNamed(Routes.ADD_REPORT),
      ),
      body: Expanded(
          child: HorTable(tableItems: StatisticController.to.tableItems)),
    );
  }
}