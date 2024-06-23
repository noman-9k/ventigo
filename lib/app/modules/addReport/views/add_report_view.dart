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
import '../../common/app_search_field.dart';
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
          leading: AppBackButton(),
          title: S.of(context).hello +
              (EmployeeService.to.employee?.value.name ?? 'Walker!')),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.defaultPadding,
          child: GetBuilder<AddReportController>(builder: (controller) {
            return Column(
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
                AppSearchField(
                    label: S.of(context).nameOfClient,
                    controller: controller.nameController,
                    fetchData: () => controller.fetchDataName(),
                    getSelectedValue: (SearchItem value) =>
                        controller.onSearchItemChanged(value)),
                // TextField(
                //         textCapitalization: TextCapitalization.sentences,
                //         controller: controller.nameController,
                //         decoration: InputDecoration(
                //             hintText: S.of(context).nameOfClient))
                //     .withLabel(S.of(context).name),
                16.verticalSpace,
                // TextField(
                //         textCapitalization: TextCapitalization.sentences,
                //         controller: controller.lastNameController,
                //         decoration: InputDecoration(
                //             hintText: S.of(context).lastNameOfClient))
                //     .withLabel(S.of(context).lastName),

                AppText.lightBoldText(S.of(context).lastName),
                SizedBox(height: 5),
                AppSearchField(
                    label: S.of(context).lastNameOfClient,
                    controller: controller.lastNameController,
                    fetchData: () => controller.fetchDataName(),
                    getSelectedValue: (SearchItem value) =>
                        controller.onSearchItemChanged(value)),
                16.verticalSpace,
                // TextField(
                //   controller: controller.phoneController,
                // ).withLabel(S.of(context).phoneNumber),

                AppText.lightBoldText(S.of(context).phoneNumber),
                SizedBox(height: 5),
                AppSearchField(
                    label: S.of(context).phoneNumber,
                    controller: controller.phoneController,
                    fetchData: () => controller.fetchDataPhone(),
                    getSelectedValue: (SearchItem value) =>
                        controller.onSearchItemChanged(value)),
                16.verticalSpace,
                YesNoButton(
                    title: S.of(context).newCustomer,
                    onChanged: (value) {
                      controller.newCustomer = value;
                    }),
                16.verticalSpace,
                YesNoButton(
                    title: S.of(context).regularCustomer,
                    // defaultValue: controller.newCustomer == null
                    //     ? null
                    //     : !controller.newCustomer!,
                    onChanged: (value) {
                      controller.regCustomer = value;
                    }),
                16.verticalSpace,
                YesNoButton(
                    title: S.of(context).paymentByCard,
                    onChanged: (value) {
                      controller.cardPay = value;
                    }),
                16.verticalSpace,
                AppText.mediumText(S.of(context).selectCategory),
                5.verticalSpace,
                CustomDropDown(
                  items: controller.categories.map((e) => e.name!).toList(),
                  onChanged: controller.onCategoryChanged,
                  title: newMethod,
                ),
                16.verticalSpace,
                AppText.mediumText(S.of(context).selectService),
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
            );
          }),
        ),
      ),
    );
  }

  String get newMethod => 'Select Category';
}
