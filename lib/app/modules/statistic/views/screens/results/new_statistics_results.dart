import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../../../config/app_colors.dart';
import '../../../../../../config/app_styles.dart';
import '../../../../../../config/app_text.dart';
import '../../../../../db/db_controller.dart';
import '../../../../../models/stats_result_model.dart';
import '../../../../dialog/dialog_functions.dart';

class NewStatisticsResults extends StatefulWidget {
  const NewStatisticsResults({super.key});

  @override
  State<NewStatisticsResults> createState() => _NewStatisticsResultsState();
}

class _NewStatisticsResultsState extends State<NewStatisticsResults> {
  bool isExpanded = false;
  Future<List<StatResultModel>>? filterFuture;

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
                  AppText.boldText('Dates'),
                  5.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(labelText: 'From'),
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
                          decoration: InputDecoration(labelText: 'To'),
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
                              .getNewStatisticsReports(
                                  fromDate: fromDate, toDate: toDate);
                          setState(() {});

                          isExpanded = false;
                        },
                        child: AppText.mediumBoldText('Apply Filters',
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: FutureBuilder<List<StatResultModel>?>(
          future:
              filterFuture ?? DbController.to.appDb.getNewStatisticsReports(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              log(snapshot.error.toString());
              return Center(
                child: Text('An error occurred'),
              );
            }

            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                child: Text('No data found'),
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
                          'Master\nName',
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
                            'No. Reg\nClient',
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
                            'No. New\nClient',
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
                            'No of\nservices',
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
                            'Cost',
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
                            'Price',
                            style: AppStyles.lightStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    size: ColumnSize.S),
              ],
              rows: List<DataRow>.generate(
                  snapshot.data!.length,
                  (index) => DataRow(
                          cells: [
                            DataCell(
                              Center(
                                child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      snapshot.data![index].employeeName
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
                                      snapshot.data![index].totalCost
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
                                      snapshot.data![index].totalPrice
                                          .toString(),
                                      style: AppStyles.lightStyle(fontSize: 13),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ),
                          ],
                          onSelectChanged: (value) {
                            log('Selected');
                          })),
            );
          }),
    );
  }
}
