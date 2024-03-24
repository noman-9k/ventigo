import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/routes/app_pages.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';

import '../../common/app_app_bar.dart';
import '../../common/date_widget.dart';
import '../controllers/main_controller.dart';
import 'widgets/horizental_data_table.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppAppBar(title: 'Hello, Walker!'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          20.verticalSpace,
          DateWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                    child: Wrap(children: [
                  Chip(
                    shape: StadiumBorder(),
                    label: AppText.mediumText('Today'),
                    deleteIcon: Icon(FontAwesomeIcons.xmark),
                    onDeleted: () {
                      print('delete');
                    },
                  ),
                ])),
                IconButton(
                    onPressed: () => Get.toNamed(Routes.FILTERS),
                    icon: Icon(FontAwesomeIcons.list))
              ],
            ),
          ),
          10.verticalSpace,
          Expanded(child: HorTable(tableItems: controller.tableItems)),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: ClipRect(
          child: BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.blueColor,
                  child: IconButton(
                    icon: const FaIcon(Icons.logout_outlined,
                        color: Colors.white),
                    onPressed: () {
                      controller.logout();
                    },
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.blueColor,
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.plus,
                        color: Colors.white),
                    onPressed: () => Get.toNamed(Routes.ADD_REPORT),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
