import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text.dart';
import '../../../app_services/local_storage_service.dart';
import '../../../constants/app_constants.dart';
import '../dialog_functions.dart';
import '../dialog_modal.dart';

class SetMaxRowsDialog extends StatefulWidget {
  const SetMaxRowsDialog(this.context, {super.key});
  final BuildContext context;

  @override
  State<SetMaxRowsDialog> createState() => _SetMaxRowsDialogState();
}

class _SetMaxRowsDialogState extends State<SetMaxRowsDialog> {
  TextEditingController maxDataRowsController = TextEditingController();
  TextEditingController maxCostRowsController = TextEditingController();
  @override
  void initState() {
    maxDataRowsController.text = '${MySharedPref.getFromDisk('maxRows') ?? ''}';
    maxCostRowsController.text = '${MySharedPref.getFromDisk(AppConstants.maxCosts) ?? ''}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DialogModel(
      child: Column(
        children: [
          TextField(
            controller: maxDataRowsController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(border: InputBorder.none),
          ).withLabel('Reports Limit'),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => saveMaxDataRows(context, maxDataRowsController.text),
              child: Text('Done'),
            )
          ]),
          TextField(
            controller: maxCostRowsController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(border: InputBorder.none),
          ).withLabel('Costs Limit'),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => saveMaxCostsRows(context, maxCostRowsController.text),
              child: Text('Done'),
            )
          ]),
        ],
      ),
    );
  }

  void saveMaxDataRows(BuildContext context, String? newValue) {
    int? value = int.tryParse(newValue ?? '');
    if (value != null && value > AppConstants.maxRows) {
      updateMaxRows(context, 'maxRows', value);

      return;
    } else {
      Get.snackbar(
        'Error',
        'Please enter a number greater than ${AppConstants.maxRows}',
        backgroundColor: Colors.red[400],
        titleText: AppText.boldText('Not Valid', color: Colors.white),
        colorText: Colors.white,
      );
      int? previousValue = MySharedPref.getFromDisk('maxRows');
      if (previousValue != null) {
        maxDataRowsController.text = previousValue.toString();
      }

      return;
    }
  }

  void saveMaxCostsRows(BuildContext context, String? newValue) {
    int? value = int.tryParse(newValue ?? '');
    if (value != null && value > AppConstants.maxRows) {
      updateMaxRows(context, AppConstants.maxCosts, value);

      return;
    } else {
      Get.snackbar(
        'Error',
        'Please enter a number greater than ${AppConstants.maxRows}',
        backgroundColor: Colors.red[400],
        titleText: AppText.boldText('Not Valid', color: Colors.white),
        colorText: Colors.white,
      );
      int? previousValue = MySharedPref.getFromDisk(AppConstants.maxCosts);
      if (previousValue != null) {
        maxCostRowsController.text = previousValue.toString();

        return;
      }
    }
  }

  void updateMaxRows(BuildContext context, String key, int value) {
    pushConfirmDialog(
      context,
      title: 'Warning!',
      message:
          'Are you sure you want to change the max rows?\n\nCaution : Data other than the last $value rows will be deleted permanently.',
      onDone: () {
        MySharedPref.saveToDisk(key, value);
        Get.snackbar(
          'Success',
          'Max Rows Updated',
          backgroundColor: AppColors.primaryColor,
          titleText: AppText.boldText('Success', color: Colors.white),
          colorText: Colors.white,
        );
        Navigator.pop(context);
      },
    );
  }
}
