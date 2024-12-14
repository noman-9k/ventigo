import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/logout_button.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../../generated/l10n.dart';
import '../../dialog/dialog_functions.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [LogoutButton()]),
      body: GetBuilder<SettingsController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: AppConstants.defaultPadding,
                child: Column(children: [
                  Image.asset('assets/icon/settings.png', height: 80.h),
                  10.verticalSpace,
                  20.verticalSpace,
                  ListTile(
                    title: AppText.boldText(S.of(context).changeAdminPassword),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      pushChangeAdminPassDialog(context);
                    },
                  ),

                  ListTile(
                    title: AppText.boldText(S.of(context).exportToFile),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      pushExportTableSelectDialog(context,
                          onDataExport: () => controller.exportDataToCSVFile(context),
                          onExpenseExport: () => controller.exportExpenseToCSVFile(context));
                    },
                  ),
                  // about section
                  ListTile(
                    title: AppText.boldText(S.of(context).securityQuestions),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      pushChangeSecurityQuestionsDialog(context);
                    },
                  ),

                  ListTile(
                    title: AppText.boldText(S.of(context).privacyPolicy),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Get.toNamed('/privacy');
                    },
                  ),
                ]),
              ),
              30.verticalSpace,
              Container(
                alignment: Alignment.centerLeft,
                color: AppColors.veryLightBlue,
                padding: EdgeInsets.only(left: 40),
                width: 1.sw,
                height: 70.h,
                child: AppText.boldText(S.of(context).dataBackup),
              ),
              GetBuilder<SettingsController>(builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      10.verticalSpace,
                      ListTile(
                        onTap: () => controller.createData(),
                        title: AppText.boldText(S.of(context).backupData),
                        leading: Image.asset(
                          'assets/icon/create_db.png',
                          color: AppColors.primaryColor,
                          height: 30.h,
                          width: 30.h,
                        ),
                      ),
                      ListTile(
                        onTap: () => controller.newRestoreData(context),
                        title: AppText.boldText(S.of(context).restoreData),
                        leading: Image.asset(
                          'assets/icon/restore_db.png',
                          color: AppColors.primaryColor,
                          height: 30.h,
                          width: 30.h,
                        ),
                      ),
                      ListTile(
                        onTap: () => pushConfirmDialog(
                          context,
                          title: S.of(context).clearData,
                          message: S.of(context).areYouSureYouWantToClearAllData,
                          onDone: () => controller.clearData(),
                        ),
                        title: AppText.boldText(S.of(context).clearData),
                        leading: Image.asset(
                          'assets/icon/clear_db.png',
                          color: AppColors.primaryColor,
                          height: 30.h,
                          width: 30.h,
                        ),
                      ),
                      20.verticalSpace,
                    ],
                  ),
                );
              }),
              50.verticalSpace
            ],
          ),
        );
      }),
    );
  }
}
