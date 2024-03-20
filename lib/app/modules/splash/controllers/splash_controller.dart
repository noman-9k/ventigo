import 'package:get/get.dart';
import 'package:ventigo/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(Routes.LOGIN);
    super.onInit();
  }
}
