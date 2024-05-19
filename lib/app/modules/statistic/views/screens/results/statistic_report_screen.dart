import 'package:data_table_2/data_table_2.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:ventigo/config/app_styles.dart';

import '../../../../../../config/app_colors.dart';

class StatisticReportScreen extends StatelessWidget {
  const StatisticReportScreen({super.key, required this.data});
  final Future<List<QueryRow>> data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QueryRow>>(
        future: data,
        builder: (context, snapshot) {
          return DataTable2(
            headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected))
                return Theme.of(context).colorScheme.primary.withOpacity(0.08);
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
                        'New\nClient',
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
                          'Reg\nClient',
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
                          'Num. of\nServices',
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
            ],
            rows: snapshot.data?.map((row) {
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
                    DataCell(Center(
                        child: Text(
                      row.read<double>('cost').toString(),
                      style: AppStyles.lightStyle(fontSize: 13),
                    ))),
                  ]);
                }).toList() ??
                [],
          );
        });
  }
}
