import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/extensions/date_extension.dart';
import 'package:ventigo/extensions/double_extensions.dart';
import 'package:ventigo/extensions/string_extensions.dart';

import '../../../../../config/app_theme.dart';
import '../../../../../generated/l10n.dart';
import '../../../../db/drift_db.dart';
import '../../../dialog/dialog_functions.dart';
import '../../controllers/main_controller.dart';

class ReportsTable extends GetView<MainController> {
  const ReportsTable({super.key, required this.stream});
  final Stream<List<DbDataItem>> stream;
  final TextStyle headerStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

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

            return Theme(
              data: AppTheme().appThemeDate.copyWith(
                    scrollbarTheme: ScrollbarThemeData(
                      // transparent track
                      // trackColor: MaterialStateProperty.all(Colors.transparent),
                      // trackBorderColor: MaterialStateProperty.all(Colors.transparent),
                      thumbColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
              child: PaginatedDataTable2(

                  // availableRowsPerPage: const [2, 5, 10, 30, 100],
                  // rowsPerPage: 20,
                  autoRowsToHeight: true,
                  columnSpacing: 10,
                  minWidth: 1650,
                  wrapInCard: false,
                  columns: [
                    DataColumn2(
                        label: Text('Employee Information', style: headerStyle, textAlign: TextAlign.center),
                        fixedWidth: 210),
                    DataColumn2(
                      label:
                          Center(child: Text(S.of(context).regncus, style: headerStyle, textAlign: TextAlign.center)),
                      size: ColumnSize.S,
                    ),
                    DataColumn2(
                        label: Center(child: Text('Cash\nPay', style: headerStyle, textAlign: TextAlign.center)),
                        size: ColumnSize.S),
                    DataColumn2(label: Text(S.of(context).customerndata, style: headerStyle), fixedWidth: 300),
                    DataColumn2(
                        label: Center(
                          child: Text(S.of(context).phone + '\n' + S.of(context).number,
                              style: headerStyle, textAlign: TextAlign.center),
                        ),
                        size: ColumnSize.M),
                    DataColumn2(
                        label: Center(child: Text(S.of(context).date, style: headerStyle, textAlign: TextAlign.start)),
                        fixedWidth: 100),
                    DataColumn2(
                        label: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(S.of(context).category, style: headerStyle, textAlign: TextAlign.center),
                            Divider(height: 2, indent: 50, endIndent: 50),
                            Text(S.of(context).service, style: headerStyle, textAlign: TextAlign.center),
                          ],
                        ),
                        fixedWidth: 320),
                    DataColumn2(
                        label:
                            Center(child: Text(S.of(context).newncus, style: headerStyle, textAlign: TextAlign.center)),
                        size: ColumnSize.S),
                    DataColumn2(
                        label: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(S.of(context).price, style: headerStyle, textAlign: TextAlign.center),
                              Divider(height: 2, indent: 15, endIndent: 15),
                              Text(S.of(context).total, style: headerStyle, textAlign: TextAlign.center),
                            ]),
                        size: ColumnSize.M,
                        numeric: true),
                    DataColumn2(
                        label: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('%', style: headerStyle),
                              Divider(height: 2, indent: 5, endIndent: 5),
                              Text(S.of(context).total, style: headerStyle),
                            ]),
                        size: ColumnSize.M,
                        numeric: true),
                    DataColumn2(
                        label: Center(child: Text(S.of(context).note, style: headerStyle, textAlign: TextAlign.center)),
                        fixedWidth: 300),
                  ],
                  source: _DbDataSource(tableItems, context, controller)),
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
      child: Image.asset(width: 15, status ?? false ? 'assets/icon/true.png' : 'assets/icon/false.png'),
    );
  }
}

class _DbDataSource extends DataTableSource {
  final List<DbDataItem> items;
  final BuildContext context;
  final MainController controller;

  _DbDataSource(this.items, this.context, this.controller);

  @override
  DataRow getRow(int index) {
    final tableItem = items[index];
    return DataRow(
      onLongPress: () => pushShowReportsBottomSheet(context, tableItem, onDelete: () {
        Navigator.pop(context);
        controller.deleteItem(context, tableItem.id);
        Get.snackbar(S.of(context).deleted, S.of(context).itemDeleted);
      }, onEdit: () {
        Navigator.pop(context);

        controller.editItem(tableItem);
      }),
      color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) return Theme.of(context).colorScheme.primary.withOpacity(0.08);

        return tableItem.date?.getDayColor();
      }),
      cells: [
        DataCell(Center(child: Text(tableItem.employeeName ?? S.of(context).noData, maxLines: 2))),
        DataCell(YesNoWidget(tableItem.regCustomer)),
        DataCell(YesNoWidget(tableItem.cardPay)),
        // DataCell(Text(tableItem.name ?? S.of(context).noData)),
        DataCell(SizedBox(
          width: 380,
          child: Column(
            children: [
              Text(tableItem.name?.split('\n').first ?? S.of(context).noData,
                  textAlign: TextAlign.start, overflow: TextOverflow.ellipsis),
              Text(tableItem.name?.split('\n').last ?? S.of(context).noData,
                  textAlign: TextAlign.start, overflow: TextOverflow.ellipsis),
            ],
          ),
        )),
        DataCell(Center(
          child: FittedBox(fit: BoxFit.fitHeight, child: Text('__' + tableItem.phone.toString().lastThreeCharacters())),
        )),
        DataCell(Text(tableItem.date?.smallDate() ?? '')),

        DataCell(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tableItem.categoryName ?? '', textAlign: TextAlign.end, overflow: TextOverflow.ellipsis),
            Divider(height: 4, indent: 30, endIndent: 30),

            // Service
            Text(tableItem.serviceName ?? '', textAlign: TextAlign.end, overflow: TextOverflow.ellipsis),
          ],
        )),
        DataCell(YesNoWidget(tableItem.newCustomer)),
        DataCell(Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(child: Text('${tableItem.price}')),
            Divider(height: 4, endIndent: 10, indent: 10),
            FittedBox(child: Text('${tableItem.total}')),
          ],
        )),
        DataCell(Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(tableItem.price!.percentageOf(tableItem.percentage)),
            ),
            Divider(height: 4, endIndent: 10, indent: 10),
            FittedBox(child: Text(tableItem.total!.percentageOf(tableItem.percentage))),
          ],
        )),
        DataCell(Text(tableItem.notes ?? '', maxLines: 2, overflow: TextOverflow.ellipsis)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => items.length;

  @override
  int get selectedRowCount => 0;
}
