import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../common/bottom_add_logout_bar.dart';
import '../../../main/controllers/main_controller.dart';
import 'tables/costs_table.dart';

class CostsScreen extends StatelessWidget {
  const CostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddLogoutBar(
        logout: () => Get.toNamed(Routes.LOGIN),
        add: () => Get.toNamed(Routes.ADD_COST),
      ),
      body:
          Expanded(child: CostsTable(tableItems: MainController.to.tableItems)),
    );
  }
}
