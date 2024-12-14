import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/app_text.dart';
import '../../../../generated/l10n.dart';
import '../../filters/controllers/filters_controller.dart';
import '../../filters/db_filter/user_data_filter.dart';
import '../controllers/main_controller.dart';
import 'widgets/reports_table.dart';

class MainReportsView extends GetView<MainController> {
  const MainReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<FiltersController>(builder: (controller) {
                return Expanded(
                  child: Builder(builder: (context) {
                    final UserDataFilter? filter = controller.filter;
                    return Wrap(alignment: WrapAlignment.end, children: [
                      filter != null
                          ? TextButton(
                              onPressed: () {
                                controller.filter = null;
                                controller.clearFilters();
                              },
                              child: AppText.mediumBoldText(S.of(context).clear + ' ' + S.of(context).filters,
                                  color: Colors.red),
                            )
                          : Container(),
                    ]);
                  }),
                );
              })
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
