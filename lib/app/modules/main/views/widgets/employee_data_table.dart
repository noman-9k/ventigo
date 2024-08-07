import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../../config/app_text.dart';
import '../../../../../generated/l10n.dart';
import '../../../../db/drift_db.dart';

class EmployeeDataTable extends StatelessWidget {
  EmployeeDataTable({super.key, required this.stream});
  final Stream<List<DbDataItem>> stream;
  DateTime currentDate = DateTime.now().onlyDate();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DbDataItem>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<DbDataItem> tableItems = snapshot.data!;
            return DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 500,
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
                      label: Text(S.of(context).regncus), size: ColumnSize.S),
                  DataColumn2(
                      label: Text(S.of(context).cardnpay), size: ColumnSize.S),
                  DataColumn2(
                      label: Text(S.of(context).employeendata,
                          textAlign: TextAlign.center),
                      size: ColumnSize.L),
                  DataColumn2(
                      label: Center(child: Text(S.of(context).date)),
                      fixedWidth: 100),
                  DataColumn2(
                      label: Column(
                        children: [
                          Text(S.of(context).category),
                          Divider(height: 1),
                          Text(S.of(context).service),
                        ],
                      ),
                      size: ColumnSize.M),
                  DataColumn2(
                      label: Text(S.of(context).price),
                      size: ColumnSize.M,
                      numeric: true),
                ],
                rows: tableItems
                    .map((tableItem) => DataRow(
                            color: MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected))
                                return Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.08);

                              Duration difference =
                                  currentDate.difference(tableItem.date!);
                              var changeColor = difference.inDays.isEven;
                              return changeColor
                                  ? Color(0xFFDDFDF1)
                                  : Colors.white;
                            }),
                            cells: [
                              DataCell(Image.asset(
                                  width: 20,
                                  tableItem.regCustomer ?? false
                                      ? 'assets/icon/true.png'
                                      : 'assets/icon/false.png')),
                              DataCell(Image.asset(
                                  width: 20,
                                  tableItem.cardPay ?? false
                                      ? 'assets/icon/true.png'
                                      : 'assets/icon/false.png')),
                              DataCell(Text(tableItem.employeeName ??
                                  S.of(context).noData)),
                              DataCell(Text(tableItem.date?.smallDate() ?? '')),
                              DataCell(Column(
                                children: [
                                  SizedBox(height: 2),
                                  AppText.lightText(
                                      tableItem.categoryName ?? '',
                                      height: 1.1,
                                      align: TextAlign.center,
                                      color: Colors.black),
                                  Divider(height: 2),
                                  AppText.lightText(tableItem.serviceName ?? '',
                                      color: Colors.black),
                                ],
                              )),
                              DataCell(Text('${tableItem.price}')),
                            ]))
                    .toList());
          }
          return Center(child: Text(S.of(context).noData));
        });
  }
}
