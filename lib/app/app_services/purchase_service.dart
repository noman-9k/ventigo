import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class PurchaseService extends GetxService {
  static PurchaseService get to => Get.find();

  Future<void> checkSubscription() async {
    Get.showSnackbar(GetSnackBar(message: 'Checking subscription...', duration: const Duration(seconds: 2)));
    if (await InternetConnectionChecker.instance.hasConnection) {
      final paywallResult = await RevenueCatUI.presentPaywallIfNeeded('pro', displayCloseButton: true);
      log('paywallResult: $paywallResult');
      return;
    }
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(message: 'No internet connection', duration: const Duration(seconds: 2)));
    log('No internet connection');
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
