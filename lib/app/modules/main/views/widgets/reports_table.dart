import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../db/drift_db.dart';

class ReportsTable extends StatelessWidget {
  const ReportsTable({super.key, required this.stream});
  final Stream<List<DbDataItem>> stream;
  // DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DbDataItem>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<DbDataItem> tableItems = snapshot.data ?? [];

            return DataTable2(
              columnSpacing: 10,
              horizontalMargin: 10,
              minWidth: 620,
              headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected))
                  return Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(0.08);
                return AppColors.lightYellow;
              }),
              columns: [
                DataColumn2(
                    label: Text('Employee\nData', textAlign: TextAlign.center),
                    size: ColumnSize.L),
                DataColumn2(label: Text('Reg\nCus'), size: ColumnSize.S),
                DataColumn2(label: Text('Card\nPay'), size: ColumnSize.S),
                DataColumn2(
                    label: Text('Customer\nData', textAlign: TextAlign.center),
                    size: ColumnSize.L),
                DataColumn2(
                    label: Center(child: Text('Date')), fixedWidth: 100),
                DataColumn2(
                    label: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Category'),
                        Divider(height: 1),
                        Text('Service'),
                      ],
                    ),
                    size: ColumnSize.M),
                DataColumn2(
                    label: Text('New\nCus', textAlign: TextAlign.center),
                    size: ColumnSize.S),
                DataColumn2(
                    label: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Price'),
                          Divider(height: 1),
                          Text('Total'),
                        ]),
                    size: ColumnSize.S,
                    numeric: true),
                DataColumn2(
                    label: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('%'),
                          Divider(height: 1),
                          Text('Total'),
                        ]),
                    size: ColumnSize.S,
                    numeric: true),
              ],
              rows: tableItems
                  .map(
                    (tableItem) => DataRow(
                      color: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected))
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.08);

                        return tableItem.date?.getDayColor();
                      }),
                      cells: [
                        DataCell(FittedBox(
                            child: Center(
                                child: Text(
                                    tableItem.employeeName ?? 'No data')))),
                        DataCell(YesNoWidget(tableItem.regCustomer)),
                        DataCell(YesNoWidget(tableItem.cardPay)),
                        DataCell(Center(
                          child: FittedBox(
                              child: Text(tableItem.name ?? 'No data')),
                        )),
                        DataCell(Text(tableItem.date?.smallDate() ?? '')),
                        DataCell(Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: Text(tableItem.categoryName ?? '',
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            Divider(height: 2),

                            // Service
                            SizedBox(
                              height: 20,
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: Text(tableItem.serviceName ?? '',
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        )),
                        DataCell(YesNoWidget(tableItem.newCustomer)),
                        DataCell(Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(child: Text('${tableItem.price}')),
                            Divider(height: 4, endIndent: 8, indent: 8),
                            FittedBox(child: Text('${tableItem.total}')),
                          ],
                        )),
                        DataCell(Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text(EmployeeService.to
                            //     .getEmployeePercentageOf(tableItem.price, tableItem.p)
                            //     .toString()),
                            // Divider(height: 4, endIndent: 8, indent: 8),
                            // Text(EmployeeService.to
                            //     .getEmployeePercentageOf(tableItem.total)
                            //     .toString()),
                          ],
                        )),
                      ],
                    ),
                  )
                  .toList(),
            );
          }
          return const Center(child: Text('No data'));
        });
  }
}

class YesNoWidget extends StatelessWidget {
  const YesNoWidget(this.status, {super.key, required});
  final bool? status;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
          width: 20,
          status ?? false ? 'assets/icon/true.png' : 'assets/icon/false.png'),
    );
  }
}
