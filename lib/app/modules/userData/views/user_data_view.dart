import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/modules/dialog/dialog_functions.dart';
import 'package:ventigo/app/modules/userData/widgets/user_data_table.dart';

import '../../../app_services/employee_service.dart';
import '../../../routes/app_pages.dart';
import '../../common/app_app_bar.dart';
import '../../common/bottom_add_logout_bar.dart';
import '../../common/date_widget.dart';
import '../controllers/user_data_controller.dart';

class UserDataView extends GetView<UserDataController> {
  const UserDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAddLogoutBar(
        logout: () => controller.logout(
          context,
        ),

        // // logout:
        // //
        //  controller.logout,
        add: () => Get.toNamed(Routes.ADD_REPORT),
      ),
      appBar: AppAppBar(
        onBack: () => controller.logout(context),
        title:
            'Hello, ' + (EmployeeService.to.employee?.value.name ?? 'Walker!'),
      ),
      body: Column(
        children: [
          20.verticalSpace,
          DateWidget(),
          10.verticalSpace,
          Expanded(child: UserDataTable(stream: controller.getAllDataItems()))
        ],
      ),
    );
  }
}
