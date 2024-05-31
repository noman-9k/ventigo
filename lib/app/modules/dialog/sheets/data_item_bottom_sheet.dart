import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../config/app_styles.dart';
import '../../../../config/app_text.dart';
import '../../../db/drift_db.dart';
import '../../main/views/widgets/reports_table.dart';

class DataItemBottomSheet extends StatelessWidget {
  const DataItemBottomSheet(this.tableItem,
      {super.key, required, this.onEdit, this.onDelete});
  final DbDataItem tableItem;
  final Function(DbDataItem)? onEdit;
  final Function(DbDataItem)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.boldText('Report: '),
                  AppText.boldText(tableItem.id.toString()),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            TitleSubtitle(
                title: 'Employee Name: ', subtitle: tableItem.employeeName),
            TitleSubtitle(
                title: 'Is Regular Cus. : ', status: tableItem.regCustomer),
            TitleSubtitle(title: 'Card Pay: ', status: tableItem.cardPay),
            TitleSubtitle(
                title: 'Date : ', subtitle: tableItem.date?.formateDate()),
            TitleSubtitle(
                title: 'Category: ', subtitle: tableItem.categoryName),
            TitleSubtitle(title: 'Service: ', subtitle: tableItem.serviceName),
            TitleSubtitle(
                title: 'Price: ', subtitle: tableItem.price.toString()),
            70.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle(
      {super.key, required this.title, this.subtitle, this.status});
  final String title;
  final String? subtitle;
  final bool? status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(text: title, style: AppStyles.boldStyle()),
            if (subtitle != null)
              TextSpan(
                  text: subtitle,
                  style: AppStyles.mediumStyle(color: Colors.black)),
          ])),
          if (status != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: YesNoWidget(status),
            ),
        ],
      ),
    );
  }
}
