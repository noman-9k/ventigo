import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:ventigo/app/modules/dialog/dialog_functions.dart';
import 'package:ventigo/app/routes/app_pages.dart';
import 'package:ventigo/config/app_styles.dart';

import '../../../../config/app_colors.dart';
import '../../../../generated/l10n.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        pushConfirmDialog(context,
            title: S.of(context).exit,
            message: S.of(context).areYouSureYouWantToLogout,
            onDone: () => Get.offAllNamed(Routes.LOGIN));
      },
      child: GetBuilder<DashboardController>(builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomBarInspiredOutside(
            height: 45,
            items: controller.navItems,
            backgroundColor: AppColors.primaryColor.withOpacity(0.9),
            color: Colors.white,
            colorSelected: AppColors.whiteColor,
            iconSize: 20,
            itemStyle: ItemStyle.circle,
            indexSelected: controller.currentIndex.value,
            countStyle: CountStyle(background: AppColors.primaryColor.withOpacity(0.9), color: Colors.white),
            chipStyle: ChipStyle(background: AppColors.primaryColor.withOpacity(0.9)),
            titleStyle: AppStyles.lightStyle(),
            onTap: (int index) => controller.onTapped(index),
          ),
          body: controller.widgetOptions[controller.currentIndex.value],
          extendBody: true,
        );
      }),
    );
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
