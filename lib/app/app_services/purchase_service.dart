import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

import 'network_controller.dart';

class PurchaseService extends GetxService {
  static PurchaseService get to => Get.find();

  Future<void> checkSubscription() async {
    final NetworkController networkController = Get.find<NetworkController>();

    Get.showSnackbar(GetSnackBar(
      message: 'Checking subscription...',
      duration: const Duration(seconds: 2),
    ));

    if (networkController.isConnected.value) {
      // Instant check without delay
      final paywallResult = await RevenueCatUI.presentPaywallIfNeeded('pro', displayCloseButton: true);
      Get.closeAllSnackbars();

      log('paywallResult: $paywallResult');
      return;
    }

    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: 'No internet connection',
      duration: const Duration(seconds: 2),
    ));
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
