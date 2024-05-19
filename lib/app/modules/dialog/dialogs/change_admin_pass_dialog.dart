import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/modules/dialog/dialog_modal.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../app_services/local_storage_service.dart';

class ChangeAdminPassDialog extends StatefulWidget {
  const ChangeAdminPassDialog({super.key});

  @override
  State<ChangeAdminPassDialog> createState() => _ChangeAdminPassDialogState();
}

class _ChangeAdminPassDialogState extends State<ChangeAdminPassDialog> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DialogModel(
        child: Column(
      children: [
        AppText.boldText('Change Admin Password'),
        16.verticalSpace,
        TextField(
          textCapitalization: TextCapitalization.sentences,
          controller: _controller,
          decoration: InputDecoration(border: InputBorder.none),
        ).withLabel('New Password'),
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
                MySharedPref.saveToDisk('admin_pin', _controller.text);
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
