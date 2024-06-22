import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/modules/dialog/dialog_functions.dart';
import 'package:ventigo/config/app_styles.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../../../config/app_colors.dart';
import '../../../../../../config/app_text.dart';
import '../../../../../../generated/l10n.dart';

class StatisticReportScreen extends StatefulWidget {
  const StatisticReportScreen({super.key});

  @override
  State<StatisticReportScreen> createState() => _StatisticReportScreenState();
}

class _StatisticReportScreenState extends State<StatisticReportScreen> {
  bool isExpanded = false;
  Future<List<drift.QueryRow>>? filterFuture;

  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              filterFuture = null;
              fromDate = null;
              toDate = null;

              isExpanded = !isExpanded;
            });
          },
          child: Icon(isExpanded ? Icons.close : Icons.filter_list),
        ),
      ),
      bottomSheet: !isExpanded
          ? null
          : Container(
              height: 250,
              width: 0.8.sw,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  AppText.boldText(S.of(context).dates),
                  5.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: S.of(context).from),
                          controller: TextEditingController(
                              text: fromDate?.smallDate()),
                          readOnly: true,
                          onTap: () {
                            pushDatePicker(context, (p0) {
                              fromDate = p0;
                              setState(() {});
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: S.of(context).to),
                          controller:
                              TextEditingController(text: toDate?.smallDate()),
                          readOnly: true,
                          onTap: () {
                            pushDatePicker(context, (p0) {
                              toDate = p0;
                              setState(() {});
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
                          filterFuture = DbController.to.appDb
                              .getStatisticsReports(
                                  fromDate: fromDate, toDate: toDate);
                          setState(() {});

                          isExpanded = false;
                        },
                        child: AppText.mediumBoldText(
                            S.of(context).applyFilters,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: FutureBuilder<List<drift.QueryRow?>>(
          future: filterFuture ?? DbController.to.appDb.getStatisticsReports(),
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
              horizontalMargin: 10,
              columns: <DataColumn2>[
                DataColumn2(
                  label: Center(
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          S.of(context).newnclient,
                          style: AppStyles.lightStyle(fontSize: 13),
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
                            S.of(context).regnclient,
                            style: AppStyles.lightStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    size: ColumnSize.S),
                DataColumn2(
                    label: Center(
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            S.of(context).numOfnservices,
                            style: AppStyles.lightStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    size: ColumnSize.S),
                DataColumn2(
                    label: Center(
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            S.of(context).costs,
                            style: AppStyles.lightStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    size: ColumnSize.S),
                DataColumn2(
                    label: Center(
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            S.of(context).sales,
                            style: AppStyles.lightStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    size: ColumnSize.S),
              ],
              rows: snapshot.data?.map((row) {
                    if (row == null) {
                      return DataRow(
                          cells: List.generate(5, (index) {
                        return DataCell(SizedBox());
                      }));
                    }

                    DateTime? date = DateTime.fromMillisecondsSinceEpoch(
                        row.read<int>('date') * 1000);

                    if (date.isAfter(toDate ??
                            DateTime.now().add(Duration(days: 20000))) ||
                        date.isBefore(fromDate ??
                            DateTime.now().subtract(Duration(days: 20000)))) {
                      return DataRow(
                          cells: List.generate(5, (index) {
                        return DataCell(SizedBox.shrink());
                      }));
                    }

                    return DataRow(cells: [
                      DataCell(Center(
                          child: Text(
                        row.read<int>('newClient').toString(),
                        style: AppStyles.lightStyle(fontSize: 13),
                      ))),
                      DataCell(Center(
                          child: Text(
                        row.read<int>('regularClient').toString(),
                        style: AppStyles.lightStyle(fontSize: 13),
                      ))),
                      DataCell(Center(
                          child: Text(
                        row.read<int>('numberOfServices').toString(),
                        style: AppStyles.lightStyle(fontSize: 13),
                      ))),
                      DataCell(FutureBuilder<double>(
                          future: DbController.to.appDb.getCostsByDate(date),
                          builder: (context, snapshot) {
                            return Center(
                              child: Text(
                                snapshot.data.toString(),
                                style: AppStyles.lightStyle(fontSize: 13),
                              ),
                            );
                          })),
                      DataCell(Center(
                          child: Text(
                        '${row.read<double?>('sales') ?? 0.0}',
                        style: AppStyles.lightStyle(fontSize: 13),
                      ))),
                    ]);
                  }).toList() ??
                  [],
            );
          }),
    );
  }
}
