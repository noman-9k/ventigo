import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/extensions/date_extension.dart';
import 'package:ventigo/extensions/double_extensions.dart';

import '../../../../../generated/l10n.dart';
import '../../../../db/drift_db.dart';
import '../../../dialog/dialog_functions.dart';
import '../../controllers/main_controller.dart';

class ReportsTable extends GetView<MainController> {
  const ReportsTable({super.key, required this.stream});
  final Stream<List<DbDataItem>> stream;
  final TextStyle headerStyle =
      const TextStyle(fontSize: 11, fontWeight: FontWeight.bold);

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
              minWidth: 660,
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
                    label: Text(S.of(context).employeendata,
                        style: headerStyle, textAlign: TextAlign.center),
                    size: ColumnSize.L),
                DataColumn2(
                  label: Text(S.of(context).regncus,
                      style: headerStyle, textAlign: TextAlign.center),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                    label: Text(S.of(context).cardnpay,
                        style: headerStyle, textAlign: TextAlign.center),
                    size: ColumnSize.S),
                DataColumn2(
                    label: Text(S.of(context).customerndata,
                        style: headerStyle, textAlign: TextAlign.center),
                    size: ColumnSize.L),
                DataColumn2(
                    label: Center(
                      child: Text(S.of(context).phone,
                          style: headerStyle, textAlign: TextAlign.center),
                    ),
                    size: ColumnSize.L),
                DataColumn2(
                    label: Center(
                        child: Text(S.of(context).date,
                            style: headerStyle, textAlign: TextAlign.center)),
                    fixedWidth: 100),
                DataColumn2(
                    label: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(S.of(context).category,
                            style: headerStyle, textAlign: TextAlign.center),
                        Divider(height: 1),
                        Text(S.of(context).service,
                            style: headerStyle, textAlign: TextAlign.center),
                      ],
                    ),
                    size: ColumnSize.M),
                DataColumn2(
                    label: Text(S.of(context).newncus,
                        style: headerStyle, textAlign: TextAlign.center),
                    size: ColumnSize.S),
                DataColumn2(
                    label: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(S.of(context).price,
                              style: headerStyle, textAlign: TextAlign.center),
                          Divider(height: 1),
                          Text(S.of(context).total,
                              style: headerStyle, textAlign: TextAlign.center),
                        ]),
                    size: ColumnSize.S,
                    numeric: true),
                DataColumn2(
                    label: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('%', style: headerStyle),
                          Divider(height: 1),
                          Text(S.of(context).total, style: headerStyle),
                        ]),
                    size: ColumnSize.S,
                    numeric: true),
              ],
              rows: tableItems
                  .map(
                    (tableItem) => DataRow(
                      onLongPress: () => pushShowReportsBottomSheet(
                          context, tableItem, onDelete: () {
                        Navigator.pop(context);
                        controller.deleteItem(context, tableItem.id);
                        Get.snackbar(
                            S.of(context).deleted, S.of(context).itemDeleted);
                      }, onEdit: () {
                        Navigator.pop(context);

                        controller.editItem(tableItem);
                      }),
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
                                child: Text(tableItem.employeeName ??
                                    S.of(context).noData)))),
                        DataCell(YesNoWidget(tableItem.regCustomer)),
                        DataCell(YesNoWidget(tableItem.cardPay)),
                        // DataCell(Text(tableItem.name ?? S.of(context).noData)),
                        DataCell(Center(
                          child: FittedBox(
                              child:
                                  Text(tableItem.name ?? S.of(context).noData)),
                        )),
                        DataCell(FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text('__' + getLast3(tableItem.phone)))),
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
                            FittedBox(
                              child: Text(tableItem.price!
                                  .percentageOf(tableItem.percentage)),
                            ),
                            Divider(height: 4, endIndent: 8, indent: 8),
                            FittedBox(
                                child: Text(tableItem.total!
                                    .percentageOf(tableItem.percentage))),
                          ],
                        )),
                      ],
                    ),
                  )
                  .toList(),
            );
          }
          return Center(child: Text(S.of(context).noData));
        });
  }

  String getLast3(String? text) {
    if (text == null) return '';
    return text.toString().substring(text.length - 3, text.length);
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
