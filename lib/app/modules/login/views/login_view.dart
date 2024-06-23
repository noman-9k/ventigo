import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_images.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/elevated_button_extension.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../generated/l10n.dart';
import '../../../constants/app_constants.dart';
import '../../common/app_close_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Row(
                children: [
                  Icon(Icons.language_outlined),
                  10.horizontalSpace,
                  AppText.boldText(controller.getCurrentFlag(), fontSize: 25),
                ],
              ),
              onPressed: () {
                Get.dialog(AlertDialog(
                  title: AppText.boldText(S.of(context).selectLanguage),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: S.delegate.supportedLocales
                        .map((e) => ListTile(
                              title: AppText.boldText(
                                  controller.getCountryName(e.languageCode)),
                              leading: AppText.boldText(
                                  controller.getFlag(e.languageCode),
                                  fontSize: 25),
                              onTap: () {
                                controller.changeLanguage(e);
                                Navigator.pop(context);
                              },
                            ))
                        .toList(),
                  ),
                ));
              },
            ),
            20.horizontalSpace
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppConstants.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.verticalSpace,
                Center(child: Image.asset(AppImages.logo)),
                40.verticalSpace,
                Center(
                    child: AppText.boldText(S.of(context).login,
                        color: AppColors.blueColor, fontSize: 24.sp)),
                4.verticalSpace,
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.blueColor,
                          borderRadius: BorderRadius.circular(5)),
                      height: 5,
                      width: 50),
                ),
                40.verticalSpace,
                TextField(
                  controller: controller.loginController,
                  decoration: InputDecoration(
                      hintText: S.of(context).userName,
                      prefixIcon:
                          Icon(Icons.person, color: AppColors.primaryColor)),
                ).withLabel(S.of(context).userName),
                10.verticalSpace,
                TextField(
                  controller: controller.passController,
                  decoration: InputDecoration(
                    hintText: S.of(context).password,
                    prefixIcon: Icon(Icons.lock_outlined,
                        color: AppColors.primaryColor),
                  ),
                ).withLabel(S.of(context).password),
                40.verticalSpace,
                Obx(() {
                  return ElevatedButton(
                      onPressed: controller.login,
                      child: controller.isLoading.isTrue
                          ? CircularProgressIndicator()
                          : AppText.mediumText(S.of(context).login));
                }),
                40.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 1,
                          margin: EdgeInsets.only(right: 15, left: 5),
                          color: AppColors.lightGrey),
                    ),
                    AppText.mediumText(S.of(context).orSignInAs,
                        color: AppColors.lightGrey),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 15, right: 5),
                          height: 1,
                          color: AppColors.lightGrey),
                    ),
                  ],
                ),
                60.verticalSpace,
                ElevatedButton(
                    onPressed: () => controller.adminLogin(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(AppImages.admin_main)),
                        10.horizontalSpace,
                        AppText.mediumText(S.of(context).adminMaine),
                      ],
                    )).alterP(isTransparent: true),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [AppCloseButton()],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
