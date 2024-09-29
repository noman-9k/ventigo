import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/modules/dialog/dialog_modal.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../generated/l10n.dart';
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
        AppText.boldText(S.of(context).changeAdminPassword),
        16.verticalSpace,
        TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(4),
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          keyboardType: TextInputType.number,
          controller: _controller,
          decoration: InputDecoration(border: InputBorder.none),
        ).withLabel(S.of(context).newPassword),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                MySharedPref.saveToDisk('admin_pin', _controller.text);
                Navigator.pop(context);
              },
              child: Text(S.of(context).done),
            ),
          ],
        )
      ],
    ));
  }
}
