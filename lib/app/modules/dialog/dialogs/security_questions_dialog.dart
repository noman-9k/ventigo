import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/local_storage_service.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/custom_dropdown.dart';
import 'package:ventigo/app/modules/dialog/dialog_modal.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../config/app_styles.dart';
import '../../../../config/app_text.dart';

class SecurityQuestionsDialog extends StatefulWidget {
  const SecurityQuestionsDialog({super.key});

  @override
  State<SecurityQuestionsDialog> createState() =>
      _SecurityQuestionsDialogState();
}

class _SecurityQuestionsDialogState extends State<SecurityQuestionsDialog> {
  TextEditingController answerController = TextEditingController();
  String selectedQuestion = '';

  @override
  Widget build(BuildContext context) {
    return DialogModel(
        child: Container(
      height: 0.45.sh,
      width: 0.8.sw,
      child: Column(
        children: [
          Text('Security Questions', style: AppStyles.boldStyle()),
          10.verticalSpace,
          if (MySharedPref.getFromDisk('question') != null ||
              MySharedPref.getFromDisk('question') != '')
            AppText.lightBoldText(
                'Previous Question:\n${MySharedPref.getFromDisk('question')}',
                align: TextAlign.center),
          10.verticalSpace,
          CustomDropDown(
            items: AppConstants.securityQuestions,
            onChanged: (value) {
              selectedQuestion = value ?? '';
            },
            title: 'Select Question',
          ),
          20.verticalSpace,
          TextField(
            controller: answerController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ).withLabel('Answer'),
          20.verticalSpace,
          ElevatedButton(
            onPressed: () {
              if (selectedQuestion.isEmpty) {
                Get.showSnackbar(GetSnackBar(
                  title: 'Please select a question',
                  message: 'Please select a question',
                  duration: Duration(seconds: 2),
                  snackPosition: SnackPosition.TOP,
                ));

                return;
              }
              if (answerController.text.trim().isEmpty ||
                  answerController.text.trim() == '') {
                Get.showSnackbar(GetSnackBar(
                  title: 'Please fill in the answer field',
                  message: 'Please fill in the answer field',
                  duration: Duration(seconds: 1),
                  snackPosition: SnackPosition.TOP,
                ));
                return;
              }

              MySharedPref.saveToDisk('question', selectedQuestion);
              MySharedPref.saveToDisk('answer', answerController.text.trim());
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
          10.verticalSpace,
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          )
        ],
      ),
    ));
  }
}
