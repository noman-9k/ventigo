import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../db/drift_db.dart';

class UserDataTable extends StatelessWidget {
  UserDataTable({super.key, required this.stream});
  final Stream<List<DbDataItem>> stream;
  DateTime currentDate = DateTime.now();

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
                  DataColumn2(label: Text('Reg\nCus'), size: ColumnSize.S),
                  DataColumn2(label: Text('Card\nPay'), size: ColumnSize.S),
                  DataColumn2(
                      label:
                          Text('Customer\nData', textAlign: TextAlign.center),
                      size: ColumnSize.L),
                  DataColumn2(
                      label: Center(child: Text('Date')), fixedWidth: 100),
                  DataColumn2(
                      label: Column(
                        children: [
                          Text('Category'),
                          Divider(height: 1),
                          Text('Service'),
                        ],
                      ),
                      size: ColumnSize.M),
                  DataColumn2(
                      label: Text('Price'), size: ColumnSize.M, numeric: true),
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
                                  ? Colors.grey[200]
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
                              DataCell(Text(tableItem.name ?? 'No data')),
                              DataCell(Text(tableItem.date?.smallDate() ?? '')),
                              DataCell(Column(
                                children: [
                                  Text('${tableItem.categoryName}'),
                                  Divider(height: 1),
                                  Text('${tableItem.serviceName}'),
                                ],
                              )),
                              DataCell(Text('${tableItem.price}')),
                            ]))
                    .toList());
          }
          return const Center(child: Text('No data'));
        });
  }
}
