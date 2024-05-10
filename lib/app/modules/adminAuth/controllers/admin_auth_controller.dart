import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ventigo/app/routes/app_pages.dart';

class AdminAuthController extends GetxController {
  late final LocalAuthentication localAuthentication;
  RxBool isSupported = false.obs;

  List<TextEditingController> pinController =
      List.generate(4, (index) => TextEditingController());

  List<FocusNode> pinFocusNode = List.generate(4, (index) => FocusNode());
  @override
  void onInit() {
    localAuthentication = LocalAuthentication();
    localAuthentication.isDeviceSupported().then((value) {
      isSupported.value = value;
    });
    getAvailableBiometrics();
    authenticate();
    super.onInit();
  }

  void login() {
    String pin = '';
    pinController.forEach((element) {
      pin += element.text;
    });

    if (pin == '1234') {
      Get.offNamed(Routes.DASHBOARD);
    } else {
      Get.snackbar('Error', 'Invalid pin');
    }
  }

  getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await localAuthentication.getAvailableBiometrics();
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
      options:
          const AuthenticationOptions(stickyAuth: true, biometricOnly: false),
    )
        .then((value) {
      if (value) {
        Get.offNamed(Routes.DASHBOARD);
      }
    });
  }
}
