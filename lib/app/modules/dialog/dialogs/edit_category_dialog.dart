import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/modules/dialog/dialog_modal.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../db/drift_db.dart';

class EditCategoryDialog extends StatefulWidget {
  const EditCategoryDialog({super.key, required this.category});
  final DbCategory category;

  @override
  State<EditCategoryDialog> createState() => _EditCategoryDialogState();
}

class _EditCategoryDialogState extends State<EditCategoryDialog> {
  late TextEditingController categoryNameController;

  @override
  void initState() {
    categoryNameController = TextEditingController(text: widget.category.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DialogModel(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          AppText.boldText('Edit Category'),
          10.verticalSpace,
          TextField(
            controller: categoryNameController,
            decoration: InputDecoration(
              labelText: 'Category Name',
              border: InputBorder.none,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  DbController.to.appDb.updateCategory(DbCategory(
                    id: widget.category.id,
                    name: categoryNameController.text,
                  ));
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
