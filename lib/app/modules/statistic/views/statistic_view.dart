import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../routes/app_pages.dart';
import '../../common/app_app_bar.dart';
import '../../common/bottom_add_logout_bar.dart';
import '../../common/date_widget.dart';
import 'widgets/horizental_data_table.dart';
import '../controllers/statistic_controller.dart';

class StatisticView extends GetView<StatisticController> {
  StatisticView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppAppBar(title: 'Hello, Walker!'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            20.verticalSpace,
            DateWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                      child: Wrap(children: [
                    Chip(
                      shape: StadiumBorder(),
                      label: AppText.mediumText('Today'),
                      deleteIcon: Icon(FontAwesomeIcons.xmark),
                      onDeleted: () {
                        print('delete');
                      },
                    ),
                  ])),
                  IconButton(
                      onPressed: () => Get.toNamed(Routes.FILTERS),
                      icon: Icon(FontAwesomeIcons.list))
                ],
              ),
            ),
            10.verticalSpace,
            Expanded(child: HorTable(tableItems: controller.tableItems)),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: BottomAddLogoutBar(
          logout: () => controller.logout(),
          add: () => Get.toNamed(Routes.ADD_REPORT),
        ));
  }
}

// @override
//   Widget build(BuildContext context) {
//     return
    //  Scaffold(
    //   body: TwoTabsView(
    //     tabNames: ["Results", "Graphics"],
    //     widgets: [
    //       Center(child: AppText.lightText('Results')),
    //       Center(child: AppText.lightText('Graphics')),
    //     ],
    //   ),
    // );
//   }
// }
