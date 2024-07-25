import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/logout_button.dart';
import 'package:ventigo/config/app_colors.dart';

import '../../../../config/app_text.dart';
import '../../../../generated/l10n.dart';
import '../../../routes/app_pages.dart';
import '../../common/app_search_field.dart';
import '../controllers/employees_controller.dart';

class EmployeesView extends GetView<EmployeesController> {
  const EmployeesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () async {
            bool isCategoryPresent = await controller.isCategoryPresent();
            isCategoryPresent
                ? Get.toNamed(Routes.ADD_EMPLOYE)
                : Get.snackbar(S.of(context).addCategoryFirst,
                    S.of(context).pleaseAddACategoryFirstToAddAnEmployee);
          },
          child: FaIcon(FontAwesomeIcons.plus, color: Colors.white),
        ),
      ),
      appBar: AppBar(
        title: AppText.boldText(S.of(context).employees, fontSize: 20),
        automaticallyImplyLeading: false,
        actions: [LogoutButton()],
      ),
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: StreamBuilder(
            stream: controller.fetchEmploys(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.data!.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset('assets/place_holders/employees.png',
                          height: 100.h, width: 100.w),
                    ),
                    20.verticalSpace,
                    AppText.mediumText(
                        S.of(context).noEmployeeFoundnpleaseAddANewEmployee,
                        align: TextAlign.center,
                        color: AppColors.lightGrey),
                    90.verticalSpace,
                  ],
                );
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    AppText.lightBoldText(S.of(context).search),
                    SizedBox(height: 5),
                    AppSearchField(
                      label: S.of(context).search,
                      fetchData: () => controller.getEmployeesSearchList(),
                      controller: TextEditingController(),
                      getSelectedValue: (EmployeeSearchItem value) =>
                          controller.scrollToValue(value.value),
                    ),
                    10.verticalSpace,
                    ListView.separated(
                      controller: controller.scrollController,
                      separatorBuilder: (context, index) =>
                          Divider(indent: 20, endIndent: 20, height: 5),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final employee = snapshot.data?[index];

                        return ListTile(
                          onTap: () => controller.viewEmployee(employee),
                          title: Text(employee!.name!),
                          subtitle: Text(employee.login ?? ''),
                          leading: CircleAvatar(
                            child: AppText.boldText(employee.name![0]),
                            radius: 25,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  AppText.mediumText(S.of(context).accessLevel,
                                      fontWeight: FontWeight.bold),
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(5),
                                          height: 15,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              color:
                                                  employee.visibility.length ==
                                                          2
                                                      ? Color(0xFF00A3E8)
                                                      : Color(0xFFA349A1),
                                              borderRadius:
                                                  BorderRadius.circular(4))),
                                      5.horizontalSpace,
                                      AppText.mediumText(
                                          employee.visibility.length == 2
                                              ? S.of(context).notLimited
                                              : S.of(context).limited),
                                    ],
                                  ),
                                ],
                              ),
                              10.horizontalSpace,
                              Icon(Icons.arrow_forward_ios_rounded)
                              // IconButton(
                              //   icon:
                              //       const Icon(Icons.arrow_forward_ios_rounded),
                              //   onPressed: () {},
                              // ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
