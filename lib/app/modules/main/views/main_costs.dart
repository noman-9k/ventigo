import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../common/bottom_add_logout_bar.dart';
import '../controllers/main_controller.dart';
import 'widgets/costs_table.dart';

class MainCostsView extends GetView<MainController> {
  const MainCostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddLogoutBar(
        logout: () => controller.logout(),
        add: () => Get.toNamed(Routes.ADD_COST),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: CostsTable(
            stream: controller.getCostsStream(),
          )),
        ],
      ),
    );
  }
}
