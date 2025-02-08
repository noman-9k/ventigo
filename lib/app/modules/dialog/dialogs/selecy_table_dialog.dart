import 'package:flutter/material.dart';
import 'package:ventigo/app/modules/dialog/dialog_modal.dart';

import '../../../../generated/l10n.dart';

class SelectExportTableDialog extends StatelessWidget {
  const SelectExportTableDialog({super.key, required this.onDataExport, required this.onExpenseExport});
  final Function() onDataExport;
  final Function() onExpenseExport;

  @override
  Widget build(BuildContext context) {
    return DialogModel(
      child: Column(
        children: [
          ListTile(title: Text(S.of(context).exportReports), onTap: onDataExport),
          ListTile(title: Text(S.of(context).exportCosts), onTap: onExpenseExport),
        ],
      ),
    );
  }
}
