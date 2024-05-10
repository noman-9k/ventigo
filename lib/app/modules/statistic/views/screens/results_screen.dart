import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../common/bottom_add_logout_bar.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: BottomAddLogoutBar(
        //   logout: () => Get.toNamed(Routes.LOGIN),
        //   add: () => Get.toNamed(Routes.ADD_REPORT),
        // ),
        // body: Expanded(child: HorTable(tableItems: MainController.to.tableItems)),
        );
  }
}
