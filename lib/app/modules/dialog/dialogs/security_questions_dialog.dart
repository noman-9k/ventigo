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
import '../../../../generated/l10n.dart';
import '../dialog_functions.dart';

class SecurityQuestionsDialog extends StatefulWidget {
  const SecurityQuestionsDialog({super.key, this.isFirstTime = false});
  final bool isFirstTime;

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
          Text(S.of(context).securityQuestions, style: AppStyles.boldStyle()),
          10.verticalSpace,
          if (MySharedPref.getFromDisk('question') != null ||
              MySharedPref.getFromDisk('question') == '')
            AppText.lightBoldText(
                S.of(context).previousQuestion +
                    ':\n${MySharedPref.getFromDisk('question') ?? ''}',
                align: TextAlign.center),
          10.verticalSpace,
          CustomDropDown(
            items: [
              S.of(context).whatIsTheNameOfYourFavoritePet,
              S.of(context).whatsYourChildhoodNickname,
              S.of(context).whatIsYourFavoriteMovie,
              S.of(context).whatIsYourFavoriteBook,
              S.of(context).whatIsYourFavoriteFood,
              S.of(context).whatIsYourFavoriteSong,
              S.of(context).whatIsYourFavoriteColor,
            ],
            onChanged: (value) {
              selectedQuestion = value ?? '';
            },
            title: S.of(context).selectQuestion,
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
                  title: S.of(context).pleaseSelectAQuestion,
                  message: S.of(context).pleaseSelectAQuestion,
                  duration: Duration(seconds: 2),
                  snackPosition: SnackPosition.TOP,
                ));

                return;
              }
              if (answerController.text.trim().isEmpty ||
                  answerController.text.trim() == '') {
                Get.showSnackbar(GetSnackBar(
                  title: S.of(context).pleaseFillInTheAnswerField,
                  message: S.of(context).pleaseFillInTheAnswerField,
                  duration: Duration(seconds: 1),
                  snackPosition: SnackPosition.TOP,
                ));
                return;
              }

              MySharedPref.saveToDisk('question', selectedQuestion);
              MySharedPref.saveToDisk('answer', answerController.text.trim());
              Navigator.pop(context);
              if (widget.isFirstTime) {
                pushChangeAdminPassDialog(context);
              }
            },
            child: Text(S.of(context).save),
          ),
          10.verticalSpace,
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(S.of(context).cancel),
          )
        ],
      ),
    ));
  }
}
