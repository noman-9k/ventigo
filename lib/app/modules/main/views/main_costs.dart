import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../common/bottom_add_logout_bar.dart';
import '../controllers/main_controller.dart';
import 'widgets/employee_data_table.dart';

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
          20.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                    child: Wrap(children: [
                  //   // Chip(
                  //   //   shape: StadiumBorder(),
                  //   //   label: AppText.mediumText('Today'),
                  //   //   deleteIcon: Icon(FontAwesomeIcons.xmark),
                  //   //   onDeleted: () {
                  //   //     print('delete');
                  //   //   },
                  //   // ),
                ])),
              ],
            ),
          ),
          10.verticalSpace,
          Expanded(
              child: EmployeeDataTable(stream: controller.getTableStream())),
        ],
      ),
    );
  }
}
