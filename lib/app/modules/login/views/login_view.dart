import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_images.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/elevated_button_extension.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../constants/app_constants.dart';
import '../../common/app_close_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              80.verticalSpace,
              Center(child: Image.asset(AppImages.logo)),
              40.verticalSpace,
              Center(
                  child: AppText.boldText('Login',
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
                    hintText: 'User Name',
                    prefixIcon:
                        Icon(Icons.person, color: AppColors.primaryColor)),
              ).withLabel('User Name'),
              10.verticalSpace,
              TextField(
                controller: controller.passController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon:
                      Icon(Icons.lock_outlined, color: AppColors.primaryColor),
                ),
              ).withLabel('Password'),
              40.verticalSpace,
              Obx(() {
                return ElevatedButton(
                    onPressed: controller.login,
                    child: controller.isLoading.isTrue
                        ? CircularProgressIndicator()
                        : AppText.mediumText('Login'));
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
                  AppText.mediumText('Or sign in with',
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
                      AppText.mediumText('Admin Maine'),
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
  }
}
