import 'package:flutter/material.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../generated/l10n.dart';
import '../../db/drift_db.dart';
import 'dialogs/change_admin_pass_dialog.dart';
import 'dialogs/category_select_dialog.dart';
import 'dialogs/edit_category_dialog.dart';
import 'dialogs/edit_service_dialog.dart';
import 'dialogs/reset_Password_dialog.dart';
import 'dialogs/security_questions_dialog.dart';
import 'dialogs/selecy_table_dialog.dart';
import 'sheets/data_item_bottom_sheet.dart';

pushChangeSecurityQuestionsDialog(BuildContext context, {bool isFirstTime = false}) {
  showDialog(
    context: context,
    builder: (context) => SecurityQuestionsDialog(isFirstTime: isFirstTime),
  );
}

pushResetPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => ResetPasswordDialog(),
  );
}

pushShowReportsBottomSheet(
  BuildContext context,
  DbDataItem tableItem, {
  Function()? onEdit,
  Function()? onDelete,
}) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    scrollControlDisabledMaxHeightRatio: 0.6,
    builder: (context) => DataItemBottomSheet(tableItem, onEdit: onEdit, onDelete: onDelete),
  );
}

pushEditServiceDialog(BuildContext context, DbService service, Function(String?) onDone) {
  showDialog(
    context: context,
    builder: (context) => EditServiceDialog(
      service: service,
      onDone: onDone,
    ),
  );
}

pushConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  required Function() onDone,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: AppText.mediumBoldText(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onDone();
          },
          child: AppText.boldText(S.of(context).confirm),
        ),
      ],
    ),
  );
}

pushEditCategoryDialog(BuildContext context, DbCategory category) {
  showDialog(
    context: context,
    builder: (context) => EditCategoryDialog(
      category: category,
    ),
  );
}

pushChangeAdminPassDialog(BuildContext context, {bool isFirstTime = false}) {
  if (isFirstTime) return pushChangeSecurityQuestionsDialog(context, isFirstTime: isFirstTime);

  showDialog(
    context: context,
    builder: (context) => ChangeAdminPassDialog(),
  );
}

pushDatePicker(BuildContext context, Function(DateTime) onDone) {
  showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    confirmText: 'Select',
    cancelText: 'Cancel',
  ).then((value) {
    if (value != null) {
      onDone(value);
    }
  });
}

pushCategorySelectDialog(
  BuildContext context, {
  required List<DbCategory> categories,
  required Function(List<DbCategory>?) onDone,
  List<DbCategory>? selectedCategories,
}) {
  showDialog(
    context: context,
    builder: (context) => CategorySelectDialog(
      categories: categories,
      onDone: onDone,
      selectedCategories: selectedCategories,
    ),
  );
}

pushExportTableSelectDialog(
  BuildContext context, {
  required Function() onDataExport,
  required Function() onExpenseExport,
}) {
  showDialog(
    context: context,
    builder: (context) => SelectExportTableDialog(onDataExport: onDataExport, onExpenseExport: onExpenseExport),
  );
}
