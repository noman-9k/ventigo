import 'package:flutter/material.dart';

import '../../db/drift_db.dart';
import 'dialogs/add_new_category_dialog.dart';
import 'dialogs/category_select_dialog.dart';
import 'dialogs/edit_category_dialog.dart';
import 'dialogs/edit_service_dialog.dart';

pushEditServiceDialog(
    BuildContext context, DbService service, Function(String?) onDone) {
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
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onDone();
          },
          child: Text('Confirm'),
        ),
      ],
    ),
  );
}

pushEditCategoryDialog(
    BuildContext context, DbCategory category, Function(String?) onDone) {
  showDialog(
    context: context,
    builder: (context) => EditCategoryDialog(
      category: category,
    ),
  );
}

pushAddNewCategoryDialog(BuildContext context, Function(String?) onDone) {
  showDialog(
    context: context,
    builder: (context) => AddNewCategoryDialog(onDone: onDone),
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
