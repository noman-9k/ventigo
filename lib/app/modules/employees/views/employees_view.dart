import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';

import '../../../../config/app_text.dart';
import '../../../routes/app_pages.dart';
import '../../common/app_search_field.dart';
import '../../common/back_button.dart';
import '../controllers/employees_controller.dart';

class EmployeesView extends GetView<EmployeesController> {
  const EmployeesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.ADD_EMPLOYE),
          child: Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        leading: AppBackButton(),
        title: AppText.boldText('Employees', fontSize: 20),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.verticalSpace,
              AppSearchField(
                label: 'Search',
                fetchData: () => controller.getEmployeesSearchList(),
                getSelectedValue: (EmployeeSearchItem value) =>
                    controller.scrollToValue(value.value),
              ),
              10.verticalSpace,
              StreamBuilder(
                  stream: controller.fetchEmploys(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.separated(
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
                                  AppText.mediumText('Access Level'),
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(5),
                                          height: 15,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(4))),
                                      5.horizontalSpace,
                                      AppText.mediumText('Full'),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
