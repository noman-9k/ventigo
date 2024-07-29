import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/app_app_bar.dart';
import 'package:ventigo/app/modules/common/back_button.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../generated/l10n.dart';
import '../../../app_services/employee_service.dart';
import '../../common/custom_dropdown.dart';
import '../../common/date_widget.dart';
import '../../common/get_services_of_category_id_widget.dart';
import '../../common/noman_search.dart';
import '../../common/yes_no_button.dart';
import '../controllers/add_report_controller.dart';

class AddReportView extends GetView<AddReportController> {
  const AddReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
          leading: AppBackButton(),
          title:
              //  S.of(context).hello +
              (EmployeeService.to.employee?.value.name ?? 'Walker!')),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateWidget(),
              20.verticalSpace,
              Center(
                  child: AppText.boldText(S.of(context).addReport,
                      fontSize: 20.sp)),
              16.verticalSpace,
              AppText.lightBoldText(S.of(context).name),
              SizedBox(height: 5),
              NomanTextFieldSearch(
                  key: ValueKey(controller.nameController),
                  label: S.of(context).nameOfClient,
                  controller: controller.nameController,
                  future: () => controller.fetchDataName(),
                  getSelectedValue: (SearchItem value) =>
                      controller.onSearchItemChanged(value)),
              16.verticalSpace,
              AppText.lightBoldText(S.of(context).lastName),
              SizedBox(height: 5),
              NomanTextFieldSearch(
                  label: S.of(context).lastNameOfClient,
                  key: ValueKey(controller.lastNameController),
                  controller: controller.lastNameController,
                  future: () => controller.fetchDataName(),
                  getSelectedValue: (SearchItem value) =>
                      controller.onSearchItemChanged(value)),
              16.verticalSpace,
              AppText.lightBoldText(S.of(context).phoneNumber),
              SizedBox(height: 5),
              NomanTextFieldSearch(
                  keyboardType: TextInputType.phone,
                  label: S.of(context).phone,
                  key: ValueKey(controller.phoneController),
                  controller: controller.phoneController,
                  future: () => controller.fetchDataPhone(),
                  getSelectedValue: (SearchItem value) =>
                      controller.onSearchItemChanged(value)),
              16.verticalSpace,
              GetBuilder<YesNoButtonController>(builder: (controller) {
                return Column(
                  children: [
                    YesNoButton(
                        title: S.of(context).newCustomer,
                        onChanged: (value) {
                          AddReportController.to.newCustomer = value;
                          controller.onNewCustomerChanged(value: value);
                        }),
                    16.verticalSpace,
                    YesNoButton(
                        key: ValueKey(controller.regCustomer),
                        title: S.of(context).regularCustomer,
                        defaultValue: controller.regCustomer == null
                            ? null
                            : controller.regCustomer,
                        onChanged: (value) {
                          controller.regCustomer = value;
                          AddReportController.to.regCustomer = value;
                        }),
                    16.verticalSpace,
                  ],
                );
              }),
              YesNoButton(
                  title: S.of(context).paymentByCard,
                  onChanged: (value) {
                    controller.cardPay = value;
                  }),
              16.verticalSpace,
              GetBuilder<AddReportController>(builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.mediumText(S.of(context).selectCategory),
                    5.verticalSpace,
                    CustomDropDown(
                        items:
                            controller.categories.map((e) => e.name!).toList(),
                        onChanged: controller.onCategoryChanged,
                        title: S.of(context).selectCategory),
                    controller.selectedCategory == null
                        ? const SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              16.verticalSpace,
                              AppText.mediumText(S.of(context).selectService),
                              5.verticalSpace,
                              GetServiceOfCategoryById(
                                  categoryId: controller.selectedCategory?.id,
                                  onChanged: controller.onServiceChanged),
                            ],
                          ),
                    16.verticalSpace,
                  ],
                );
              }),
              TextField(
                  controller: controller.priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: S.of(context).priceOfService,
                  )).withLabel(S.of(context).price),
              16.verticalSpace,
              Obx(() {
                return ElevatedButton(
                    onPressed: controller.submit,
                    child: controller.isLoading.isTrue
                        ? CircularProgressIndicator()
                        : AppText.boldText(S.of(context).submit,
                            color: Colors.white));
              })
            ],
          ),
        ),
      ),
    );
  }
}
