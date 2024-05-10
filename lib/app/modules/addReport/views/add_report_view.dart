import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/app_app_bar.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../app_services/employee_service.dart';
import '../../common/custom_dropdown.dart';
import '../../common/date_widget.dart';
import '../../common/get_services_of_category_id_widget.dart';
import '../../common/yes_no_button.dart';
import '../controllers/add_report_controller.dart';

class AddReportView extends GetView<AddReportController> {
  const AddReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
          title: 'Hello, ' +
              (EmployeeService.to.employee?.value.name ?? 'Walker!')),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.defaultPadding,
          child: GetBuilder<AddReportController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                DateWidget(),
                20.verticalSpace,
                Center(child: AppText.boldText('Add Report', fontSize: 20.sp)),
                16.verticalSpace,
                TextField(
                        controller: controller.nameController,
                        decoration: InputDecoration(hintText: 'Name of Client'))
                    .withLabel('Name'),
                16.verticalSpace,
                TextField(
                        controller: controller.lastNameController,
                        decoration:
                            InputDecoration(hintText: 'Last Name of Client'))
                    .withLabel('Last Name'),
                16.verticalSpace,
                TextField(
                        controller: controller.phoneController,
                        decoration: InputDecoration(labelText: 'Phone Number'))
                    .withLabel('Phone Number'),
                16.verticalSpace,
                YesNoButton(
                    title: 'New Customer',
                    onChanged: (value) {
                      controller.newCustomer = value;
                    }),
                16.verticalSpace,
                YesNoButton(
                    title: 'Regular Customer',
                    onChanged: (value) {
                      controller.regCustomer = value;
                    }),
                16.verticalSpace,
                YesNoButton(
                    title: 'Payment by Card',
                    onChanged: (value) {
                      controller.cardPay = value;
                    }),
                16.verticalSpace,
                AppText.mediumText('Select Category'),
                CustomDropDown(
                  items: controller.categories.map((e) => e.name!).toList(),
                  onChanged: controller.onCategoryChanged,
                  title: 'Select Category',
                ),
                16.verticalSpace,
                AppText.mediumText('Select Service'),
                controller.selectedCategory == null
                    ? const SizedBox()
                    : GetServiceOfCategoryById(
                        categoryId: controller.selectedCategory?.id,
                        onChanged: controller.onServiceChanged),
                16.verticalSpace,
                TextField(
                    controller: controller.priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Price of Service',
                    )).withLabel('Price'),
                16.verticalSpace,
                Obx(() {
                  return ElevatedButton(
                      onPressed: controller.submit,
                      child: controller.isLoading.isTrue
                          ? CircularProgressIndicator()
                          : AppText.boldText('Submit', color: Colors.white));
                })
              ],
            );
          }),
        ),
      ),
    );
  }
}
