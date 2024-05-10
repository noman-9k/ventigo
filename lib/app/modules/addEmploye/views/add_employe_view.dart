import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/config/app_enums.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../common/back_button.dart';
import '../controllers/add_employe_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  const AddEmployeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: AppBackButton(),
          title: AppText.boldText('Add Employee'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppConstants.defaultPadding,
            child: GetBuilder<AddEmployeeController>(builder: (controller) {
              return Column(
                children: [
                  TextField(
                          controller: controller.nameController,
                          decoration:
                              InputDecoration(hintText: 'Enter your name'))
                      .withLabel('Name'),
                  10.verticalSpace,
                  TextField(
                      controller: controller.lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your last name',
                      )).withLabel('Last Name'),
                  10.verticalSpace,
                  TextField(
                      controller: controller.loginController,
                      decoration: InputDecoration(
                        hintText: 'Enter your login',
                      )).withLabel('Login'),
                  10.verticalSpace,
                  TextField(
                      controller: controller.passController,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                      )).withLabel('Password'),
                  10.verticalSpace,
                  AppText.mediumText(
                      'Select Categories from the list\n(maybe several)',
                      align: TextAlign.center),
                  10.verticalSpace,
                  TextField(
                          readOnly: true,
                          onTap: () => controller.categoryTab(context),
                          controller: controller.categoriesController,
                          decoration:
                              InputDecoration(hintText: 'Select categories'))
                      .withLabel('Categories'),
                  10.verticalSpace,
                  AppText.mediumText('Set percentage of income if necessary',
                      align: TextAlign.center),
                  5.verticalSpace,
                  TextField(
                    controller: controller.percentageController,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: 'Set percentage of income'),
                  ).withLabel('Percentage'),
                  10.verticalSpace,
                  AppText.mediumText(
                      ' Visibility level with a cross from the list',
                      align: TextAlign.center),
                  10.verticalSpace,
                  _checkbox(
                      title: 'Employee Percentage',
                      type: VisibilityFilter.percentage),
                  10.verticalSpace,
                  _checkbox(
                      title: 'Total Percentage per month',
                      type: VisibilityFilter.percentageMonth),
                  10.verticalSpace,
                  _checkbox(
                      title: 'Amount Percentage per day',
                      type: VisibilityFilter.percentageDay),
                  10.verticalSpace,
                  _checkbox(
                      title: 'Number of Service for month',
                      type: VisibilityFilter.numberOfServices),
                  10.verticalSpace,
                  _checkbox(
                      title: 'Show Phone)', type: VisibilityFilter.showPhone),
                  10.verticalSpace,
                  _checkbox(
                      title: 'Total Price Service per day',
                      type: VisibilityFilter.servicesPerDay),
                  24.verticalSpace,
                  ElevatedButton(
                    onPressed: () => controller.saveEmployee(),
                    child:
                        AppText.boldText('Save Employee', color: Colors.white),
                  ),
                ],
              );
            }),
          ),
        ));
  }

  _checkbox({required String title, required VisibilityFilter type}) {
    return SizedBox(
      child: CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          dense: true,
          tileColor: Color(0xFFECECEC),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          value: controller.trueFilters.contains(type),
          onChanged: (value) {
            controller.onVisibilityFilterChange(type, value!);
          },
          title: AppText.mediumText(title, maxLines: 1)),
    );
  }
}
