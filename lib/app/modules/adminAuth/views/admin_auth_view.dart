import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/app_services/local_storage_service.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../../generated/l10n.dart';
import '../../../constants/app_images.dart';
import '../../dialog/dialog_functions.dart';
import '../controllers/admin_auth_controller.dart';

class AdminAuthView extends GetView<AdminAuthController> {
  const AdminAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          100.verticalSpace,
          Image.asset(AppImages.logo),
          40.verticalSpace,
          AppText.boldText(S.of(context).adminLogin, fontSize: 20.sp),
          40.verticalSpace,
          if (MySharedPref.getFromDisk('admin_pin') == null)
            TextButton(
                onPressed: () {
                  pushChangeAdminPassDialog(context, isFirstTime: true);
                },
                child: AppText.lightBoldText(S.of(context).setAdminPassword,
                    color: Colors.red, fontSize: 15.sp)),
          AppText.boldText(S.of(context).enterPasswordHere, fontSize: 20.sp),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                return Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: controller.pinController[index],
                      focusNode: controller.pinFocusNode[index],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.pinController[index].text =
                              value[value.length - 1];
                        }

                        if (value.isNotEmpty) {
                          if (index != 3) {
                            controller.pinFocusNode[index + 1].requestFocus();
                          }
                        } else {
                          if (index != 0) {
                            controller.pinFocusNode[index - 1].requestFocus();
                          }
                        }
                      },
                      onSubmitted: (value) {
                        controller.pinFocusNode[index].unfocus();
                        if (index == 3) {
                          controller.login();
                        }
                      },
                      keyboardType: TextInputType.number,
                      obscureText: true,
                    ),
                  ),
                );
              }),
            ),
          ),
          40.verticalSpace,
          if (MySharedPref.getFromDisk('question') != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.boldText(S.of(context).forgotPassword),
                10.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    pushResetPasswordDialog(context);
                  },
                  child: AppText.boldText(S.of(context).resetHere,
                      color: Colors.blue),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
