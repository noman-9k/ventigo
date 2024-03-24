import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:ventigo/config/app_styles.dart';

import '../../../../config/app_colors.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: BottomBarInspiredOutside(
          height: 45,
          items: controller.navItems,
          backgroundColor: AppColors.primaryColor,
          color: Colors.white,
          colorSelected: AppColors.whiteColor,
          iconSize: 20,
          itemStyle: ItemStyle.circle,
          indexSelected: controller.currentIndex.value,
          countStyle: CountStyle(
              background: AppColors.primaryColor, color: Colors.white),
          chipStyle: ChipStyle(background: AppColors.primaryColor),
          titleStyle: AppStyles.lightStyle(),
          onTap: (int index) => controller.onTapped(index),
        ),
        body: controller.widgetOptions[controller.currentIndex.value],
      );
    });
  }
}

class NavItem {
  final String title;
  final IconData icon;
  int? index;

  NavItem({
    required this.title,
    required this.icon,
    this.index,
  });
}
