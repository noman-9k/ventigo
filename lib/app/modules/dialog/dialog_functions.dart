import 'package:flutter/material.dart';
import 'package:ventigo/app/models/caregory.dart';
import 'package:ventigo/extensions/date_extension.dart';

import 'dialogs/add_new_category_dialog.dart';
import 'dialogs/category_select_dialog.dart';

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
  required List<Category> categories,
  required Function(List<Category>?) onDone,
  List<Category>? selectedCategories,
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
