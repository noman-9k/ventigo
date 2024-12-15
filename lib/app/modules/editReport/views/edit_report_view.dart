import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/back_button.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../generated/l10n.dart';
import '../../common/custom_dropdown.dart';
import '../../common/get_services_of_category_id_widget.dart';
import '../../common/yes_no_button.dart';
import '../controllers/edit_report_controller.dart';

class EditReportView extends GetView<EditReportController> {
  const EditReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppText.boldText(S.of(context).editReport, fontSize: 20.sp), leading: AppBackButton()),
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
                        decoration: InputDecoration(hintText: S.of(context).nameOfClient))
                    .withLabel(S.of(context).name),
                16.verticalSpace,
                TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: controller.lastNameController,
                        decoration: InputDecoration(hintText: S.of(context).lastNameOfClient))
                    .withLabel(S.of(context).lastName),
                16.verticalSpace,
                TextField(
                  controller: controller.phoneController,
                ).withLabel(S.of(context).phoneNumber),
                16.verticalSpace,
                YesNoButton(
                    title: S.of(context).newCustomer,
                    onChanged: (value) {
                      controller.newCustomer = value;
                    }),
                16.verticalSpace,
                YesNoButton(
                    title: S.of(context).regularCustomer,
                    onChanged: (value) {
                      controller.regCustomer = value;
                    }),
                16.verticalSpace,
                YesNoButton(
                    title: 'Payment By Cash',
                    onChanged: (value) {
                      controller.cardPay = value;
                    }),
                16.verticalSpace,
                AppText.mediumText(S.of(context).selectCategory),
                5.verticalSpace,
                CustomDropDown(
                  items: controller.categories?.map((e) => e.name!).toList(),
                  onChanged: controller.onCategoryChanged,
                  title: S.of(context).selectCategory,
                ),
                16.verticalSpace,
                AppText.mediumText(S.of(context).selectService),
                5.verticalSpace,
                controller.selectedCategory == null
                    ? const SizedBox()
                    : GetServiceOfCategoryById(
                        categoryId: controller.selectedCategory?.id, onChanged: controller.onServiceChanged),
                16.verticalSpace,
                // TextField(
                //     controller: controller.priceController,
                //     keyboardType: TextInputType.number,
                //     decoration: InputDecoration(
                //       hintText: 'Price of Service',
                //     )).withLabel('Price'),
                // 16.verticalSpace,
                Obx(() {
                  return ElevatedButton(
                      onPressed: controller.editReport,
                      child: controller.isLoading.isTrue
                          ? CircularProgressIndicator()
                          : AppText.boldText(S.of(context).submit, color: Colors.white));
                }),
                16.verticalSpace,
              ],
            );
          }),
        ),
      ),
    );
  }
}
