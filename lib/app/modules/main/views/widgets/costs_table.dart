import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/modules/dialog/dialog_functions.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../generated/l10n.dart';
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
                    label: Text(S.of(context).nameOfncost,
                        textAlign: TextAlign.center, style: headerStyle)),
                DataColumn2(
                    label: Text(
                  S.of(context).relatedncategories,
                  textAlign: TextAlign.center,
                  style: headerStyle,
                )),
                DataColumn2(
                    label: Text(
                  S.of(context).deductednfromTax,
                  textAlign: TextAlign.center,
                  style: headerStyle,
                )),
                DataColumn2(
                    label: Center(
                        child: Text(S.of(context).date, style: headerStyle))),
                DataColumn2(
                    label: Center(
                        child: Text(
                            S.of(context).price + '\n' + S.of(context).cost,
                            style: headerStyle))),
                DataColumn2(
                    label: Text(
                  S.of(context).systematicnexpenditure,
                  textAlign: TextAlign.center,
                  style: headerStyle,
                )),
              ],
              rows: tableItems
                  .map((tableItem) => DataRow(
                          onLongPress: () => pushConfirmDialog(
                                context,
                                title: S.of(context).deleteCost,
                                message: S
                                    .of(context)
                                    .areYouSureYouWantToDeleteThisCost,
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
          return Center(child: Text(S.of(context).noData));
        });
  }
}
