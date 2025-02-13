import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/modules/userData/controllers/user_data_controller.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/extensions/date_extension.dart';
import 'package:ventigo/extensions/double_extensions.dart';
import 'package:ventigo/extensions/string_extensions.dart';

import '../../../../generated/l10n.dart';
import '../../../db/drift_db.dart';

class UserDataTable extends StatelessWidget {
  const UserDataTable({super.key, required this.stream});
  final Stream<List<DbDataItem>> stream;
  // DateTime currentDate = DateTime.now();
  final TextStyle headerStyle = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    fontFeatures: [FontFeature.tabularFigures()],
  );

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
              columnSpacing: 10,
              horizontalMargin: 10,
              minWidth: 1350,
              headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                if (states.contains(MaterialState.selected))
                  return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                return AppColors.lightYellow;
              }),
              columns: [
                DataColumn2(label: Center(child: Text(S.of(context).regncus, style: headerStyle)), size: ColumnSize.S),
                DataColumn2(label: Center(child: Text(S.of(context).cashnpay, style: headerStyle)), size: ColumnSize.S),
                DataColumn2(label: Text(S.of(context).customerndata, style: headerStyle), fixedWidth: 300),
                DataColumn2(
                    label: Center(
                      child: Text(S.of(context).phonennumber, style: headerStyle, textAlign: TextAlign.center),
                    ),
                    size: ColumnSize.L),
                DataColumn2(label: Center(child: Text(S.of(context).date, style: headerStyle)), fixedWidth: 100),
                DataColumn2(
                    label: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(S.of(context).category, style: headerStyle),
                        Divider(height: 2, indent: 50, endIndent: 50),
                        Text(S.of(context).service, style: headerStyle, maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                    fixedWidth: 320),
                DataColumn2(
                    label: Center(child: Text(S.of(context).newncus, style: headerStyle, textAlign: TextAlign.center)),
                    size: ColumnSize.S),
                DataColumn2(
                    label: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(S.of(context).price, style: headerStyle),
                          Divider(height: 2, indent: 15, endIndent: 15),
                          Text(S.of(context).total, style: headerStyle),
                        ]),
                    size: ColumnSize.M,
                    numeric: true),
                if (UserDataController.to.isEmployeePerVisible())
                  DataColumn2(
                      label: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('%', style: headerStyle),
                            Divider(height: 2, indent: 15, endIndent: 15),
                            Text(S.of(context).total, style: headerStyle),
                          ]),
                      size: ColumnSize.M,
                      numeric: true),
                DataColumn2(
                    label: Center(child: Text(S.of(context).note, style: headerStyle, textAlign: TextAlign.center)),
                    fixedWidth: 250),
              ],
              rows: tableItems
                  .map(
                    (tableItem) => DataRow(
                      color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected))
                          return Theme.of(context).colorScheme.primary.withOpacity(0.08);

                        return tableItem.date?.getDayColor();
                      }),
                      cells: [
                        DataCell(YesNoWidget(tableItem.regCustomer)),
                        DataCell(YesNoWidget(tableItem.cardPay)),
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
                          child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text('..' + tableItem.phone.toString().lastThreeCharacters()
                                  // substring(
                                  //     tableItem.phone.toString().length - 3,
                                  //     tableItem.phone.toString().length),
                                  )),
                        )),
                        DataCell(Center(child: Text(tableItem.date?.smallDate() ?? ''))),
                        DataCell(Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(tableItem.categoryName ?? '',
                                textAlign: TextAlign.end, overflow: TextOverflow.ellipsis),
                            Divider(height: 3, indent: 30, endIndent: 30),
                            Text(tableItem.serviceName ?? '',
                                textAlign: TextAlign.end, overflow: TextOverflow.ellipsis),
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
                        if (UserDataController.to.isEmployeePerVisible())
                          DataCell(Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(tableItem.price!.percentageOf(tableItem.percentage)),
                              Divider(height: 4, endIndent: 15, indent: 15),
                              Text(tableItem.total!.percentageOf(tableItem.percentage)),
                            ],
                          )),
                        DataCell(Text(tableItem.notes ?? '', maxLines: 2, overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  )
                  .toList(),
            );
          }
          return Center(child: Text(S.of(context).noData));
        });
  }
}

class YesNoWidget extends StatelessWidget {
  const YesNoWidget(this.status, {super.key, required});
  final bool? status;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(width: 20, status ?? false ? 'assets/icon/true.png' : 'assets/icon/false.png'),
    );
  }
}
