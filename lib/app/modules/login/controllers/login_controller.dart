import 'package:get/get.dart';
import 'package:ventigo/app/routes/app_pages.dart';

class LoginController extends GetxController {
  login() {
    Get.toNamed(Routes.DASHBOARD);
  }
}
