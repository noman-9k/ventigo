import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/extensions/double_extensions.dart';
import 'package:ventigo/extensions/list_extension.dart';

import '../../../../../../config/app_colors.dart';
import '../../../../../../config/app_styles.dart';
import '../../../../../../config/app_text.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../models/stats_result_model.dart';
import '../../../../dialog/dialog_functions.dart';
import 'controler/new_statistics_results_controller.dart';

class NewStatisticsResults extends GetView<NewStatisticsResultsController> {
  const NewStatisticsResults({super.key});
  final TextStyle headerStyle =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Obx(() {
          return FloatingActionButton(
            onPressed: () => controller.changeBottomSheet(
                value: controller.isBottomSheetOpen.isFalse),
            child: Icon(controller.isBottomSheetOpen.isTrue
                ? Icons.close
                : Icons.filter_list),
          );
        }),
      ),
      bottomSheet: Obx(() {
        return Container(
          child: !controller.isBottomSheetOpen.isTrue
              ? SizedBox()
              : Container(
                  height: 270,
                  width: 0.8.sw,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.boldText(S.of(context).dates),
                          30.verticalSpace,
                          TextButton(
                              onPressed: () {
                                controller.clearFilters();
                              },
                              child: AppText.mediumBoldText(
                                  S.of(context).clearDates,
                                  color: AppColors.redColor)),
                        ],
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: S.of(context).from),
                              controller: controller.fromDateController,
                              readOnly: true,
                              onTap: () {
                                pushDatePicker(context, (p0) {
                                  controller.updateDate(fromDate: p0);
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration:
                                  InputDecoration(labelText: S.of(context).to),
                              controller: controller.toDateController,
                              readOnly: true,
                              onTap: () {
                                pushDatePicker(context, (p0) {
                                  controller.updateDate(toDate: p0);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              controller.getFilteredStream();
                              controller.changeBottomSheet(value: false);
                            },
                            child: AppText.mediumBoldText(
                                S.of(context).applyFilters,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GetBuilder<NewStatisticsResultsController>(builder: (controller) {
        return FutureBuilder<List<StatResultModel>?>(
            future: controller.filterFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                log(snapshot.error.toString());
                return Center(
                  child: Text(S.of(context).anErrorOccurred),
                );
              }

              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(
                  child: Text(S.of(context).noDataFound),
                );
              }

              return DataTable2(
                headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.08);
                  return AppColors.lightYellow;
                }),
                columnSpacing: 10,
                minWidth: 700,
                horizontalMargin: 10,
                columns: <DataColumn2>[
                  DataColumn2(
                    label: Center(
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            S.of(context).masternname,
                            style: headerStyle,
                            textAlign: TextAlign.center,
                          )),
                    ),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                      label: Center(
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              S.of(context).noRegnclient,
                              style: headerStyle,
                            )),
                      ),
                      size: ColumnSize.S),
                  DataColumn2(
                      label: Center(
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              S.of(context).noNewnclient,
                              style: headerStyle,
                            )),
                      ),
                      size: ColumnSize.S),
                  DataColumn2(
                      label: Center(
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              'Unique\nClients',
                              style: headerStyle,
                            )),
                      ),
                      size: ColumnSize.S),
                  DataColumn2(
                      label: Center(
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(S.of(context).noOfnservices,
                                style: headerStyle)),
                      ),
                      size: ColumnSize.S),
                  DataColumn2(
                      label: Center(
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              S.of(context).costOfMaterials,
                              style: headerStyle,
                              textAlign: TextAlign.center,
                            )),
                      ),
                      size: ColumnSize.S),
                  DataColumn2(
                      label: Center(
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              S.of(context).pricenservices,
                              style: headerStyle,
                              textAlign: TextAlign.center,
                            )),
                      ),
                      size: ColumnSize.M),
                  DataColumn2(
                      label: Center(
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              '%' + '\n' + S.of(context).employees,
                              style: headerStyle,
                              textAlign: TextAlign.center,
                            )),
                      ),
                      size: ColumnSize.M),
                  DataColumn2(
                      label: Center(
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              S.of(context).netProfit,
                              style: headerStyle,
                              textAlign: TextAlign.center,
                            )),
                      ),
                      size: ColumnSize.M),
                ],
                rows: List<DataRow>.generate(
                  snapshot.data!.length,
                  (index) {
                    if (snapshot.data![index].employeeName == 'Total') {
                      return DataRow(
                        color: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected))
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.08);
                          return AppColors.lightYellow;
                        }),
                        cells: [
                          DataCell(
                            Center(
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    snapshot.data![index].employeeName
                                        .toString(),
                                    style: AppStyles.boldStyle(
                                        fontSize: 13, color: Colors.green),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    snapshot.data![index].noRegCustomer
                                        .toString(),
                                    style: AppStyles.boldStyle(
                                        fontSize: 13, color: Colors.green),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    snapshot.data![index].noNewCustomer
                                        .toString(),
                                    style: AppStyles.boldStyle(
                                        fontSize: 13, color: Colors.green),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    snapshot.data![index].uniqueCustomers
                                        .toString(),
                                    style: AppStyles.boldStyle(
                                        fontSize: 13, color: Colors.green),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    snapshot.data![index].totalServices
                                        .toString(),
                                    style: AppStyles.boldStyle(
                                        fontSize: 13, color: Colors.green),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    snapshot.data![index].totalCost.toString(),
                                    style: AppStyles.boldStyle(
                                        fontSize: 13, color: Colors.green),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    (snapshot.data![index].totalPrice -
                                            snapshot.data![index].totalCost)
                                        .toString(),
                                    style: AppStyles.boldStyle(
                                        fontSize: 13, color: Colors.green),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    snapshot.data![index].percentage.toString(),
                                    style: AppStyles.boldStyle(
                                        fontSize: 13, color: Colors.green),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    (snapshot.data![index].totalPrice -
                                            snapshot.data![index].percentage -
                                            snapshot.data![index].totalCost -
                                            snapshot.data![index].shopCost!)
                                        .toString(),
                                    style: AppStyles.boldStyle(
                                        fontSize: 13, color: Colors.green),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                        ],
                      );
                    }

                    return DataRow(
                      // color: MaterialStateProperty.resolveWith<Color?>(
                      //     (Set<MaterialState> states) {
                      //   if (states.contains(MaterialState.disabled))
                      //     return Theme.of(context)
                      //         .colorScheme
                      //         .primary
                      //         .withOpacity(0.08);
                      //   return AppColors.lightYellow;
                      // }),
                      cells: [
                        DataCell(
                          Center(
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  snapshot.data![index].employeeName.toString(),
                                  style: AppStyles.lightStyle(fontSize: 13),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  snapshot.data![index].noRegCustomer
                                      .toString(),
                                  style: AppStyles.lightStyle(fontSize: 13),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  snapshot.data![index].noNewCustomer
                                      .toString(),
                                  style: AppStyles.lightStyle(fontSize: 13),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  // snapshot.data![index].uniqueCustomers
                                  //     .toString(),
                                  '',
                                  style: AppStyles.lightStyle(fontSize: 13),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  snapshot.data![index].totalServices
                                      .toString(),
                                  style: AppStyles.lightStyle(fontSize: 13),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  snapshot.data![index].totalCost.toString(),
                                  style: AppStyles.lightStyle(fontSize: 13),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  snapshot.data![index].totalPrice.toString(),
                                  style: AppStyles.lightStyle(fontSize: 13),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  snapshot.data![index].percentage.toString(),
                                  // .percentageOf(
                                  //     snapshot.data![index].percentage)
                                  // .toString(),
                                  style: AppStyles.lightStyle(fontSize: 13),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  (snapshot.data![index].totalPrice -
                                          snapshot.data![index].percentage -
                                          snapshot.data![index].totalCost)
                                      .toString(),
                                  style: AppStyles.lightStyle(fontSize: 13),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            });
      }),
    );
  }
}
