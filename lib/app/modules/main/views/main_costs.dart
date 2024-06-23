import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/costsFilter/controllers/costs_filter_controller.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text.dart';
import '../../../../generated/l10n.dart';
import '../../../routes/app_pages.dart';
import '../../filters/db_filter/costs_filter.dart';
import '../../filters/db_filter/user_data_filter.dart';
import '../controllers/main_controller.dart';
import 'widgets/costs_table.dart';

class MainCostsView extends GetView<MainController> {
  const MainCostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          child: FaIcon(FontAwesomeIcons.plus, color: Colors.white),
          onPressed: () => Get.toNamed(Routes.ADD_COST),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<CostsFilterController>(builder: (controller) {
                  return Expanded(
                    child: Builder(builder: (context) {
                      final CostsFilter? filter = controller.filter;
                      return Wrap(alignment: WrapAlignment.end, children: [
                        filter != null
                            ? TextButton(
                                onPressed: () {
                                  controller.filter = null;
                                  controller.clearFilters();
                                },
                                child: AppText.mediumBoldText(
                                    S.of(context).clear +
                                        ' ' +
                                        S.of(context).filters,
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
          Expanded(
              child: GetBuilder<CostsFilterController>(builder: (controller) {
            return CostsTable(stream: controller.currentCostStream);
          })),
        ],
      ),
    );
  }
}
