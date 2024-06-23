import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/employee_service.dart';
import 'package:ventigo/app/routes/app_pages.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../generated/l10n.dart';
import '../../../app_services/local_storage_service.dart';
import '../../../constants/app_constants.dart';

class LoginController extends GetxController {
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();

  RxBool isLoading = false.obs;

  login() async {
    isLoading.value = true;

    var employee = await EmployeeService.to
        .employeeLogin(loginController.text.trim(), passController.text.trim());

    if (employee != null) {
      Get.offAllNamed(Routes.USER_DATA);
    } else {
      Get.showSnackbar(GetSnackBar(
        title: S.current.error,
        message: S.current.loginOrPasswordIsIncorrect,
      ));
    }

    isLoading.value = false;
  }

  adminLogin({bool isCost = false}) {
    Get.offAllNamed(Routes.ADMIN_AUTH, arguments: isCost);
    // Get.toNamed(Routes.ADMIN_AUTH);
  }

  void changeLanguage(Locale e) {
    // check if the current locale
    log('current locale is ${intl.Intl.getCurrentLocale()}',
        name: 'OnBoardingController');

    intl.Intl.defaultLocale = e.languageCode;

    S.load(e);
    MySharedPref.setLanguage(e.languageCode);
    update();
  }

  String getFlag(String languageCode) {
    AppConstants.languages.map((e) => log(e.languageCode));

    return AppConstants.languages
        .firstWhere((element) => element.languageCode == languageCode)
        .countryFlag;
  }

  String getCurrentFlag() {
    return AppConstants.languages
        .firstWhere(
            (element) => element.languageCode == intl.Intl.getCurrentLocale())
        .countryFlag;
  }

  String getCountryName(String languageCode) {
    return AppConstants.languages
        .firstWhere((element) => element.languageCode == languageCode)
        .language;
  }
}
