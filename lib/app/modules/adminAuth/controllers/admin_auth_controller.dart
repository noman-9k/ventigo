import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ventigo/app/app_services/local_storage_service.dart';
import 'package:ventigo/app/routes/app_pages.dart';

import '../../../../generated/l10n.dart';

class AdminAuthController extends GetxController {
  late final LocalAuthentication localAuthentication;
  RxBool isSupported = false.obs;
  bool isCost = false;

  TextEditingController pinController = TextEditingController();

  @override
  void onInit() {
    localAuthentication = LocalAuthentication();
    localAuthentication.isDeviceSupported().then((value) {
      isSupported.value = value;
    });
    getAvailableBiometrics();
    authenticate();
    try {
      isCost = Get.arguments;
    } catch (e) {
      log(e.toString());
    }

    super.onInit();
  }

  void login() {
    String pin = pinController.text;

    if (pin == (MySharedPref.getFromDisk('admin_pin'))) {
      isCost ? Get.offNamed(Routes.ADD_COST) : Get.offNamed(Routes.DASHBOARD);
    } else {
      Get.snackbar(S.current.error, S.current.invalidPin);
    }
  }

  getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = await localAuthentication.getAvailableBiometrics();
    log(availableBiometrics.toString());

    if (availableBiometrics.contains(BiometricType.face)) {
      log('Face ID is available');
    } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
      log('Fingerprint is available');
    }
  }

  authenticate() async {
    try {
      bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;
      if (canCheckBiometrics) {
        authenticateWithBiometrics();
      } else {
        Get.snackbar('Error', 'Biometrics not available');
      }
    } catch (e) {
      Get.snackbar('Error', 'Biometrics not available');
    }
  }

  void authenticateWithBiometrics() {
    localAuthentication
        .authenticate(
      localizedReason: 'Authenticate to access the Admin app',
      options: const AuthenticationOptions(stickyAuth: true, biometricOnly: false),
    )
        .then((value) {
      if (value) {
        isCost ? Get.offNamed(Routes.ADD_COST) : Get.offNamed(Routes.DASHBOARD);
      }
    });
  }
}
