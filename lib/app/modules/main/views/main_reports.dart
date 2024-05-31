import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/filters/controllers/filters_controller.dart';
import 'package:ventigo/app/modules/filters/db_filter/user_data_filter.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../db/db_controller.dart';
import '../controllers/main_controller.dart';
import 'widgets/reports_table.dart';

class MainReportsView extends GetView<MainController> {
  const MainReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        20.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.mediumBoldText('Press an Hold Item to View Details',
                  color: Colors.grey[500]),
              // GetBuilder<FiltersController>(builder: (controller) {
              //   return Expanded(
              //     child: Builder(builder: (context) {
              //       final UserDataFilter? filter = controller.filter;
              //       return Wrap(children: [
              //         filter?.name != null
              //             ? Chip(label: Text(filter!.name!))
              //             : Container(),
              //       ]);
              //     }),
              //   );
              // })
            ],
          ),
        ),
        10.verticalSpace,
        Expanded(child: GetBuilder<MainController>(builder: (controller) {
          return ReportsTable(stream: controller.currentStream);
        }))
      ],
    );
  }
}
