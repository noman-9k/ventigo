import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/local_storage_service.dart';
import 'package:ventigo/app/modules/dialog/dialog_modal.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../generated/l10n.dart';
import '../../../routes/app_pages.dart';

class ResetPasswordDialog extends StatefulWidget {
  const ResetPasswordDialog({super.key});

  @override
  State<ResetPasswordDialog> createState() => _ResetPasswordDialogState();
}

class _ResetPasswordDialogState extends State<ResetPasswordDialog> {
  TextEditingController answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DialogModel(
        child: SizedBox(
            height: 0.4.sh,
            child: Column(
              children: [
                20.verticalSpace,
                AppText.mediumBoldText(
                    S.of(context).answerTheSecurityQuestionsToLogin,
                    color: AppColors.primaryColor),
                40.verticalSpace,
                AppText.mediumBoldText(
                    MySharedPref.getFromDisk('question') ?? ''),
                20.verticalSpace,
                TextField(
                  controller: answerController,
                ).withLabel(S.of(context).answer),
                40.verticalSpace,
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    if (answerController.text.trim() ==
                        MySharedPref.getFromDisk('answer')) {
                      Navigator.pop(context);
                      Get.offAllNamed(Routes.DASHBOARD);
                    } else {
                      Get.showSnackbar(GetSnackBar(
                        title: S.of(context).incorrectAnswer,
                        message: S.of(context).pleaseTryAgain,
                        duration: Duration(seconds: 2),
                        snackPosition: SnackPosition.TOP,
                      ));
                    }
                  },
                  child: Text(S.of(context).submit),
                )
              ],
            )));
  }
}
