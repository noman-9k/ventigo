import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppConstants.defaultPadding,
              child: Column(children: [
                20.verticalSpace,
                Image.asset('assets/icon/settings.png', height: 80.h),
                10.verticalSpace,
                AppText.boldText('General Settings'),
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
                    // Get.toNamed('/theme');
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
            Spacer(),
            Container(
              alignment: Alignment.center,
              color: AppColors.veryLightBlue,
              width: 1.sw,
              height: 70.h,
              child: AppText.boldText('Data Backup'),
            ),
            Container(
              color: AppColors.blueColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    10.verticalSpace,
                    ListTile(
                      title: AppText.boldText('Create Data',
                          color: AppColors.whiteColor),
                      leading: Image.asset(
                        'assets/icon/create_db.png',
                        height: 30.h,
                        width: 30.h,
                      ),
                    ),
                    ListTile(
                      title: AppText.boldText('Restore Data',
                          color: AppColors.whiteColor),
                      leading: Image.asset(
                        'assets/icon/restore_db.png',
                        height: 30.h,
                        width: 30.h,
                      ),
                    ),
                    // clear data
                    ListTile(
                      title: AppText.boldText('Clear Data',
                          color: AppColors.whiteColor),
                      leading: Image.asset(
                        'assets/icon/clear_db.png',
                        height: 30.h,
                        width: 30.h,
                      ),
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
