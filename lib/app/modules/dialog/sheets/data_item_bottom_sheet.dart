import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/modules/common/svg_icon.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../config/app_styles.dart';
import '../../../../config/app_text.dart';
import '../../../../generated/l10n.dart';
import '../../../constants/app_images.dart';
import '../../../db/drift_db.dart';
import '../../main/views/widgets/reports_table.dart';

class DataItemBottomSheet extends StatelessWidget {
  const DataItemBottomSheet(this.tableItem,
      {super.key, required, this.onEdit, this.onDelete});
  final DbDataItem tableItem;
  final Function()? onEdit;
  final Function()? onDelete;

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
                  AppText.boldText(S.of(context).report),
                  AppText.boldText(tableItem.id.toString()),
                  Spacer(),
                  IconButton(
                    icon: SvgIcon(icon: AppImages.edit_ic),
                    //  Icon(Icons.edit),
                    onPressed: () => onEdit?.call(),
                  ),
                  IconButton(
                    icon: SvgIcon(icon: AppImages.delete),
                    // Icon(Icons.delete_forever_outlined,
                    //     color: AppColors.redColor),
                    onPressed: () => onDelete?.call(),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            TitleSubtitle(
                title: S.of(context).employeeName,
                subtitle: tableItem.employeeName),
            TitleSubtitle(
                title: S.of(context).isRegularCus,
                status: tableItem.regCustomer),
            TitleSubtitle(
                title: S.of(context).cardPay, status: tableItem.cardPay),
            TitleSubtitle(
                title: S.of(context).date,
                subtitle: tableItem.date?.formateDate()),
            TitleSubtitle(
                title: S.of(context).category,
                subtitle: tableItem.categoryName),
            TitleSubtitle(
                title: S.of(context).service, subtitle: tableItem.serviceName),
            TitleSubtitle(
                title: S.of(context).price,
                subtitle: tableItem.price.toString()),
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
