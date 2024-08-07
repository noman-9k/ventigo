import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/modules/dialog/dialog_modal.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../generated/l10n.dart';
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
          AppText.boldText(S.of(context).editCategory),
          10.verticalSpace,
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: categoryNameController,
          ).withLabel(S.of(context).categoryName),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(S.of(context).cancel),
              ),
              TextButton(
                onPressed: () {
                  DbController.to.appDb.updateCategory(DbCategory(
                    id: widget.category.id,
                    name: categoryNameController.text,
                  ));
                  Navigator.pop(context);
                },
                child: Text(S.of(context).save),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
