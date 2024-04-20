import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/config/app_text.dart';

import '../../common/back_button.dart';
import '../../common/custom_dropdown.dart';
import '../controllers/add_service_controller.dart';

class AddServiceView extends GetView<AddServiceController> {
  const AddServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: AppBackButton(),
          title: AppText.boldText('Add Service'),
          centerTitle: true),
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText.mediumText('Create Or Select a category'),
            16.verticalSpace,
            GetBuilder<AddServiceController>(builder: (controller) {
              return CustomDropDown(
                items: controller.categories.map((e) => e.name).toList(),
                onChanged: controller.onCategoryChanged,
                title: 'Select Category',
              );
            }),
            32.verticalSpace,
            AppText.mediumText('Name of the Service'),
            10.verticalSpace,
            TextField(
              controller: controller.serviceNameController,
              decoration: InputDecoration(
                  labelText: 'Service Name', hintText: 'Enter Service Name'),
            ),
            32.verticalSpace,
            AppText.mediumText('Cost of Materials for this Services'),
            10.verticalSpace,
            TextField(
              controller: controller.priceController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Price', hintText: 'Enter Price'),
            ),
            32.verticalSpace,
            ElevatedButton(
              onPressed: controller.addService,
              child: AppText.boldText('Add Service'),
            ),
          ],
        ),
      ),
    );
  }
}
