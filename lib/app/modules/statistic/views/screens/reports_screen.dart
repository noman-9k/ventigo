import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../common/bottom_add_logout_bar.dart';
import '../../../main/controllers/main_controller.dart';
import '../../../main/views/widgets/horizental_data_table.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddLogoutBar(
        logout: () => Get.toNamed(Routes.LOGIN),
        add: () => Get.toNamed(Routes.ADD_REPORT),
      ),
      body: Expanded(child: HorTable(tableItems: MainController.to.tableItems)),
    );
  }
}
