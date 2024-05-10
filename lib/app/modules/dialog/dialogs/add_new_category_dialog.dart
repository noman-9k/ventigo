import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/modules/dialog/dialog_modal.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

class AddNewCategoryDialog extends StatefulWidget {
  const AddNewCategoryDialog({super.key, required this.onDone});
  final Function(String?) onDone;

  @override
  State<AddNewCategoryDialog> createState() => _AddNewCategoryDialogState();
}

class _AddNewCategoryDialogState extends State<AddNewCategoryDialog> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DialogModel(
        child: Column(
      children: [
        AppText.boldText('Enter Category Name'),
        16.verticalSpace,
        TextField(
          controller: _controller,
          decoration: InputDecoration(border: InputBorder.none),
        ).withLabel('Category Name'),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                widget.onDone(_controller.text);
                Navigator.pop(context);
              },
              child: Text('Done'),
            ),
          ],
        )
      ],
    ));
  }
}
