import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/config/app_text.dart';

import '../../common/back_button.dart';
import '../../common/custom_dropdown.dart';
import '../controllers/add_employe_controller.dart';
import 'widgets/employee_checkbox.dart';

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
          child: Column(
            children: [
              TextField(
                  decoration: InputDecoration(
                      labelText: 'Name', hintText: 'Enter your name')),
              10.verticalSpace,
              TextField(
                  decoration: InputDecoration(
                labelText: 'Last Name',
                hintText: 'Enter your last name',
              )),
              10.verticalSpace,
              TextField(
                  decoration: InputDecoration(
                labelText: 'Login',
                hintText: 'Enter your login',
              )),
              10.verticalSpace,
              TextField(
                  decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              )),
              10.verticalSpace,
              AppText.mediumText(
                  'Select Categories from the list\n(maybe several)',
                  align: TextAlign.center),
              10.verticalSpace,
              GetBuilder<AddEmployeeController>(builder: (controller) {
                return TextField(
                    readOnly: true,
                    onTap: () => controller.categoryTab(context),
                    controller: TextEditingController(
                        text: controller.selectedCategories
                            .map((e) => e.name)
                            .join(', ')),
                    decoration: InputDecoration(
                        labelText: 'Categories',
                        hintText: 'Select categories'));
              }),
              10.verticalSpace,
              AppText.mediumText('Set percentage of income if necessary',
                  align: TextAlign.center),
              10.verticalSpace,
              CustomDropDown(
                items:
                    List.generate(10, (index) => '${(index * 5)} %'.toString()),
                title: 'Set Percentage',
                onChanged: (p0) {
                  print(p0);
                },
              ),
              10.verticalSpace,
              AppText.mediumText(' Visibility level with a cross from the list',
                  align: TextAlign.center),
              10.verticalSpace,
              EmployeeCheckbox(
                  text: ' Employee Percentage', onChanged: (value) {}),
              10.verticalSpace,
              EmployeeCheckbox(
                  text: ' Total Percentage per month', onChanged: (value) {}),
              10.verticalSpace,
              EmployeeCheckbox(
                  text: ' Amount Percentage per day', onChanged: (value) {}),
              10.verticalSpace,
              EmployeeCheckbox(
                  text: ' Number of Service for month', onChanged: (value) {}),
              10.verticalSpace,
              EmployeeCheckbox(
                  text: ' Hide Phone (visible last 3 numbers)',
                  onChanged: (value) {}),
              10.verticalSpace,
              EmployeeCheckbox(
                  text: ' Total Price Service per day', onChanged: (value) {}),
              10.verticalSpace,
              24.verticalSpace,
              ElevatedButton(
                onPressed: () => controller.getAllEmployees(),
                child: AppText.boldText('Save Employee', color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
