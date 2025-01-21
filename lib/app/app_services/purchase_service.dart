import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:ventigo/config/app_styles.dart';

import 'connection_check_controller.dart';
import 'network_controller.dart';

class PurchaseService extends GetxService {
  static PurchaseService get to => Get.find();

  Future<void> checkSubscription() async {
    Get.closeAllSnackbars();
    Get.defaultDialog(
      title: 'Checking subscription...',
      titleStyle: AppStyles.mediumStyle(),
      content: const CircularProgressIndicator(),
      barrierDismissible: false,
    );

    bool isConnected = await InternetConnectionChecker.instance.hasConnection;

    Get.back();
    if (isConnected) {
      final paywallResult = await RevenueCatUI.presentPaywallIfNeeded('pro', displayCloseButton: true);

      log('paywallResult: $paywallResult');
      return;
    }

    Get.showSnackbar(GetSnackBar(
      snackStyle: SnackStyle.GROUNDED,
      message: 'No internet connection\nPlease check your internet connection',
      duration: const Duration(seconds: 2),
    ));
  }

  Future<bool> isPurchased() async {
    log('isPurchased');
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();

    if (customerInfo.entitlements.all.isEmpty) {
      return false;
    }
    if (!kDebugMode) {
      return true;
    }
    return customerInfo.entitlements.all['pro']?.isActive ?? false;
  }
}
