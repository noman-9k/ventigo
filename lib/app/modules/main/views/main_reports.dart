import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../userData/widgets/user_data_table.dart';
import '../controllers/main_controller.dart';
import 'widgets/employee_data_table.dart';
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
        Expanded(child: ReportsTable(stream: controller.getReports()))
      ],
    );
  }
}
