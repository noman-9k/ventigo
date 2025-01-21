import 'dart:developer';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionCheckController extends GetxController {
  final RxBool isConnected = false.obs; // Default to true

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
  }

  void _initConnectivity() async {
    bool newtWorkCheck = await InternetConnectionChecker.instance.hasConnection;
    log(newtWorkCheck.toString(), name: 'ConnectionCheckController');
    _updateConnectionStatus(newtWorkCheck);
  }

  void _updateConnectionStatus(bool newtWorkCheck) {
    // If at least one connection type is available, consider it "connected"
    isConnected.value = newtWorkCheck;
    log(isConnected.value.toString(), name: 'ConnectionCheckController _updateConnectionStatus');
  }

  void refresh() {
    _initConnectivity();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
