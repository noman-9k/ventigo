import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_images.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/elevated_button_extension.dart';

import '../../../constants/app_constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: Column(
          children: [
            100.verticalSpace,
            Image.asset(AppImages.logo),
            60.verticalSpace,
            AppText.boldText('Login',
                color: AppColors.blueColor, fontSize: 24.sp),
            4.verticalSpace,
            Container(
                decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(5)),
                height: 5,
                width: 50),
            60.verticalSpace,
            TextField(
              decoration: InputDecoration(
                  label: AppText.mediumText('User Name'),
                  prefixIcon: Icon(FontAwesomeIcons.user)),
            ),
            10.verticalSpace,
            TextField(
              decoration: InputDecoration(
                label: AppText.mediumText('Password'),
                prefixIcon: Icon(Icons.lock_outlined),
              ),
            ),
            60.verticalSpace,
            ElevatedButton(
                onPressed: () => controller.login(),
                child: AppText.mediumText('Login')),
            60.verticalSpace,
            Row(
              children: [
                // horizental devider
                Expanded(
                  child: Container(
                      height: 1,
                      margin: EdgeInsets.only(right: 15, left: 5),
                      color: AppColors.lightGrey),
                ),
                AppText.mediumText('Or sign in with',
                    color: AppColors.lightGrey),
                // horizental devider
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
            ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(AppImages.admin_cost)),
                    10.horizontalSpace,
                    AppText.mediumText('Admin Cost'),
                  ],
                )).alterP(isTransparent: true),
          ],
        ),
      ),
    );
  }
}
