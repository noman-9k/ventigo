import 'dart:developer';

import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class PurchaseService extends GetxService {
  static PurchaseService get to => Get.find();

  Future<void> checkSubscription() async {
    final paywallResult = await RevenueCatUI.presentPaywallIfNeeded('pro', displayCloseButton: true);
    log('paywallResult: $paywallResult');
  }

  Future<bool> isPurchased() async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();

    if (customerInfo.entitlements.all.isEmpty) {
      return false;
    }
    return customerInfo.entitlements.all['pro']?.isActive ?? false;
  }
}
