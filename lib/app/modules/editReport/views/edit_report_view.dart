import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/back_button.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../common/custom_dropdown.dart';
import '../../common/get_services_of_category_id_widget.dart';
import '../../common/yes_no_button.dart';
import '../controllers/edit_report_controller.dart';

class EditReportView extends GetView<EditReportController> {
  const EditReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AppText.boldText('Edit Report', fontSize: 20.sp),
          leading: AppBackButton()),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.defaultPadding,
          child: GetBuilder<EditReportController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: controller.nameController,
                        decoration: InputDecoration(hintText: 'Name of Client'))
                    .withLabel('Name'),
                16.verticalSpace,
                TextField(
                        textCapitalization: TextCapitalization.sentences,
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
                5.verticalSpace,
                CustomDropDown(
                  items: controller.categories?.map((e) => e.name!).toList(),
                  onChanged: controller.onCategoryChanged,
                  title: 'Select Category',
                ),
                16.verticalSpace,
                AppText.mediumText('Select Service'),
                5.verticalSpace,
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
                      onPressed: controller.editReport,
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