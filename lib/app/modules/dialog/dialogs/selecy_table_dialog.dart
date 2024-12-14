import 'package:flutter/material.dart';
import 'package:ventigo/app/modules/dialog/dialog_modal.dart';

class SelectExportTableDialog extends StatelessWidget {
  const SelectExportTableDialog({super.key, required this.onDataExport, required this.onExpenseExport});
  final Function() onDataExport;
  final Function() onExpenseExport;

  @override
  Widget build(BuildContext context) {
    return DialogModel(
      child: Column(
        children: [
          ListTile(title: Text('Export Sales'), onTap: onDataExport),
          ListTile(title: Text('Export Expenditure'), onTap: onExpenseExport),
        ],
      ),
    );
  }
}
