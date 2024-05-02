import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/employee_service.dart';
import 'package:ventigo/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();

  RxBool isLoading = false.obs;

  login() async {
    isLoading.value = true;

    var employee = await EmployeeService.to
        .employeeLogin(loginController.text.trim(), passController.text.trim());

    if (employee != null) {
      Get.toNamed(Routes.USER_DATA);
    } else {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'Login or password is incorrect',
      ));
    }

    isLoading.value = false;
  }

  adminLogin() {
    Get.toNamed(Routes.DASHBOARD);
  }
}
