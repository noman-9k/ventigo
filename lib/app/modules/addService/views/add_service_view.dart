import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../common/back_button.dart';
import '../../common/custom_dropdown.dart';
import '../controllers/add_service_controller.dart';

class AddServiceView extends GetView<AddServiceController> {
  const AddServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => controller.getAll(),
      //   child: Icon(Icons.arrow_forward),
      // ),
      appBar: AppBar(
          leading: AppBackButton(),
          title: AppText.boldText('Add Service'),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText.mediumText('Create Or Select a category'),
              16.verticalSpace,
              GetBuilder<AddServiceController>(builder: (controller) {
                return StreamBuilder(
                    stream: DbController.to.appDb.getAllCategories(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CustomDropDown(
                          items: snapshot.data!.map((e) => e.name!).toList(),
                          onChanged: controller.onCategoryChanged,
                          title: 'Select Category',
                        );
                      }
                      return CircularProgressIndicator();
                    });
              }),
              10.verticalSpace,
              AppText.mediumText('Or Create a new Category'),
              10.verticalSpace,
              TextField(
                // onTap: controller.addNewCategory,
                // readOnly: true,
                controller: controller.categoryNameController,
                decoration: InputDecoration(
                  hintText: 'Enter Category Name',
                ),
              ).withLabel('Category Name'),
              32.verticalSpace,
              AppText.mediumText('Name of the Service'),
              10.verticalSpace,
              TextField(
                controller: controller.serviceNameController,
                decoration: InputDecoration(hintText: 'Enter Service Name'),
              ).withLabel('Service Name'),
              32.verticalSpace,
              AppText.mediumText('Cost of Materials for this Services'),
              10.verticalSpace,
              TextField(
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Price'),
              ).withLabel('Price'),
              32.verticalSpace,
              ElevatedButton(
                onPressed: controller.dbAddService,
                child: AppText.boldText('Add Service', color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
