import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';

import '../../dialog/dialog_functions.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: AppConstants.defaultPadding,
            child: Column(children: [
              20.verticalSpace,
              Image.asset('assets/icon/settings.png', height: 80.h),
              10.verticalSpace,
              // AppText.boldText('General Settings'),
              20.verticalSpace,
              ListTile(
                title: AppText.boldText('Language'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Get.toNamed('/language');
                },
              ),
              ListTile(
                title: AppText.boldText('Currency'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Get.toNamed('/currency');
                },
              ),
              ListTile(
                title: AppText.boldText('Export to file'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  controller.exportToCSVFile();
                },
              ),
              // about section
              ListTile(
                title: AppText.boldText('About'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Get.toNamed('/about');
                },
              ),
              ListTile(
                title: AppText.boldText('Privacy Policy'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Get.toNamed('/privacy');
                },
              ),
            ]),
          ),
          Container(
            alignment: Alignment.centerLeft,
            color: AppColors.veryLightBlue,
            padding: EdgeInsets.only(left: 40),
            width: 1.sw,
            height: 70.h,
            child: AppText.boldText('Data Backup'),
          ),
          GetBuilder<SettingsController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  10.verticalSpace,
                  ListTile(
                    onTap: () => controller.createData(),
                    title: AppText.boldText('BackUp Data'),
                    leading: Image.asset(
                      'assets/icon/create_db.png',
                      color: AppColors.primaryColor,
                      height: 30.h,
                      width: 30.h,
                    ),
                  ),
                  ListTile(
                    onTap: () => controller.pushRestoreDialog(),
                    title: AppText.boldText('Restore Data'),
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
                      title: 'Clear Data',
                      message: 'Are you sure you want to clear all data?',
                      onDone: () => controller.clearData(),
                    ),
                    title: AppText.boldText('Clear Data'),
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
  }
}
