import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/app_app_bar.dart';
import 'package:ventigo/config/app_text.dart';

import '../../common/custom_dropdown.dart';
import '../../common/date_widget.dart';
import '../../common/yes_no_button.dart';
import '../controllers/add_report_controller.dart';

class AddReportView extends GetView<AddReportController> {
  const AddReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Hello Walker!'),
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
                    decoration: InputDecoration(
                        labelText: 'Name', hintText: 'Name of Client')),
                16.verticalSpace,
                TextField(
                    decoration: InputDecoration(
                        labelText: 'LastName',
                        hintText: 'Last Name of Client')),
                16.verticalSpace,
                TextField(
                    decoration: InputDecoration(labelText: 'Phone Number')),
                16.verticalSpace,
                YesNoButton(title: 'New Customer', onChanged: (_) {}),
                16.verticalSpace,
                YesNoButton(
                    title: 'Regular Customer',
                    onChanged: (_) {},
                    defaultValue: true),
                16.verticalSpace,
                YesNoButton(title: 'Payment CASH', onChanged: (_) {}),
                16.verticalSpace,
                AppText.mediumText('Select Category'),
                CustomDropDown(
                  items: controller.categories.map((e) => e.name).toList(),
                  onChanged: controller.onCategoryChanged,
                  title: 'Select Category',
                ),
                16.verticalSpace,
                AppText.mediumText('Select Service'),
                CustomDropDown(
                  items: controller.selectedCategoryServices
                      .map((e) => e.name)
                      .toList(),
                  onChanged: controller.onServiceChanged,
                  title: 'Select Service',
                ),
                16.verticalSpace,
                TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Price of Service',
                      labelText: 'Price',
                    )),
                16.verticalSpace,
                ElevatedButton(
                    onPressed: () => controller.submit(), child: Text('Submit'))
              ],
            );
          }),
        ),
      ),
    );
  }
}