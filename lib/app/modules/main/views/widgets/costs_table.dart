import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../db/drift_db.dart';
import '../../../userData/widgets/user_data_table.dart';

class CostsTable extends StatelessWidget {
  const CostsTable({super.key, required this.stream});
  final Stream<List<DbCost>> stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DbCost>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<DbCost> tableItems = snapshot.data!;
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
                  return Colors.grey[200];
                }),
                columns: [
                  DataColumn2(
                      label:
                          Text('Name of\nCost', textAlign: TextAlign.center)),
                  DataColumn2(
                      label: Text(
                    'Related\nCategories',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  )),
                  DataColumn2(
                      label: Text(
                    'Deducted\nFrom TAX',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  )),
                  DataColumn2(label: Center(child: Text('Date'))),
                  DataColumn2(label: Center(child: Text('Price'))),
                  DataColumn2(
                      label: Text(
                    'Systematic\nExpenditure',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  )),
                ],
                rows: tableItems
                    .map((tableItem) => DataRow(
                            color: MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                              return Colors.grey[100];
                            }),
                            cells: [
                              DataCell(Text(tableItem.name ?? '')),
                              DataCell(Center(
                                  child:
                                      Text(tableItem.categories.join(', ')))),
                              DataCell(YesNoWidget(tableItem.isDeductFromTax)),
                              DataCell(Text(
                                tableItem.date?.smallDate() ?? '',
                                style: TextStyle(fontSize: 10),
                              )),
                              DataCell(Center(
                                  child: Text(tableItem.price.toString()))),
                              DataCell(YesNoWidget(tableItem.isSystematic)),
                            ]))
                    .toList());
          }
          return const Center(child: Text('No data'));
        });
  }
}
