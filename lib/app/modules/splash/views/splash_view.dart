import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_images.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(AppImages.logo)));
  }
}
