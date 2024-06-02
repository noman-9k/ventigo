import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/modules/dialog/dialog_functions.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../../config/app_colors.dart';
import '../../../../db/drift_db.dart';
import '../../../userData/widgets/user_data_table.dart';

class CostsTable extends StatelessWidget {
  const CostsTable({super.key, required this.stream});
  final Stream<List<DbCost>> stream;

  final TextStyle headerStyle =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

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
              headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected))
                  return Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(0.08);
                return AppColors.lightYellow;
              }),
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 500,
              columns: [
                DataColumn2(
                    label: Text('Name of\nCost',
                        textAlign: TextAlign.center, style: headerStyle)),
                DataColumn2(
                    label: Text(
                  'Related\nCategories',
                  textAlign: TextAlign.center,
                  style: headerStyle,
                )),
                DataColumn2(
                    label: Text(
                  'Deducted\nFrom TAX',
                  textAlign: TextAlign.center,
                  style: headerStyle,
                )),
                DataColumn2(
                    label: Center(child: Text('Date', style: headerStyle))),
                DataColumn2(
                    label: Center(child: Text('Price', style: headerStyle))),
                DataColumn2(
                    label: Text(
                  'Systematic\nExpenditure',
                  textAlign: TextAlign.center,
                  style: headerStyle,
                )),
              ],
              rows: tableItems
                  .map((tableItem) => DataRow(
                          onLongPress: () => pushConfirmDialog(
                                context,
                                title: 'Delete Cost',
                                message:
                                    'Are you sure you want to delete this cost?',
                                onDone: () => DbController.to.appDb
                                    .deleteCost(tableItem.id),
                              ),
                          color: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            return Colors.grey[000];
                          }),
                          cells: [
                            DataCell(Text(tableItem.name ?? '')),
                            DataCell(Center(
                                child: Text(tableItem.categories.join(', ')))),
                            DataCell(YesNoWidget(tableItem.isDeductFromTax)),
                            DataCell(Text(
                              tableItem.date?.smallDate() ?? '',
                              style: TextStyle(fontSize: 10),
                            )),
                            DataCell(Center(
                                child: Text(tableItem.price.toString()))),
                            DataCell(YesNoWidget(tableItem.isSystematic)),
                          ]))
                  .toList(),
            );
          }
          return const Center(child: Text('No data'));
        });
  }
}
