import 'package:flutter/material.dart';

import 'dialogs/add_new_category_dialog.dart';

pushAddNewCategoryDialog(BuildContext context, Function(String?) onDone) {
  showDialog(
    context: context,
    builder: (context) => AddNewCategoryDialog(onDone: onDone),
  );
}
