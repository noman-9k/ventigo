import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/yes_no_button.dart';
import 'package:ventigo/app/modules/filters/views/widgets/masters_selection.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../generated/l10n.dart';
import '../../common/back_button.dart';
import '../controllers/filters_controller.dart';
import 'widgets/categories_section.dart';
import 'widgets/date_section.dart';

class FiltersView extends GetView<FiltersController> {
  const FiltersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   label: AppText.mediumBoldText(S.of(context).applyFilters,
      //       color: Colors.white),
      //   backgroundColor: AppColors.primaryColor,
      //   onPressed: () => controller.applyFilters(),
      // ),
      appBar: AppBar(
        leading: AppBackButton(),
        title: AppText.boldText(S.of(context).filters, fontSize: 20.sp),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              controller.clearFilters();
            },
            child: Row(children: [
              AppText.mediumBoldText(S.of(context).clear, color: Colors.red),
              5.horizontalSpace,
              Icon(Icons.close, color: Colors.red)
            ]),
          )
        ],
      ),
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.verticalSpace,
              Divider(indent: 20, endIndent: 20),
              YesNoButton(
                  defaultValue: controller.isRegularCustomer,
                  onChanged: (value) {
                    controller.isRegularCustomer = value;
                  },
                  title: S.of(context).regularCustomer),
              10.verticalSpace,
              YesNoButton(
                  defaultValue: controller.isCustomerCard,
                  onChanged: (value) {
                    controller.isCustomerCard = value;
                  },
                  title: S.of(context).cardPay),
              Divider(indent: 20, endIndent: 20),
              10.verticalSpace,
              TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: controller.nameController,
                      decoration: InputDecoration())
                  .withLabel(S.of(context).name),
              10.verticalSpace,
              TextField(controller: controller.phoneController, decoration: InputDecoration())
                  .withLabel(S.of(context).phone),
              10.verticalSpace,
              TextField(controller: controller.notesController).withLabel(S.of(context).note),
              10.verticalSpace,
              Divider(indent: 20, endIndent: 20),
              10.verticalSpace,
              MastersSelection(),
              10.verticalSpace,
              DateSection(),
              10.verticalSpace,
              CategoriesSection(),
              10.verticalSpace,
              // ServicesSection(),
              10.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.boldText(S.of(context).priceRange, fontSize: 20.sp),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.minPriceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: S.of(context).minPrice),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: TextField(
                          controller: controller.maxPriceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: S.of(context).maxPrice),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // PriceRangeSlider(),
              10.verticalSpace,
              YesNoButton(
                  defaultValue: controller.isNewCustomer,
                  onChanged: (value) {
                    controller.isNewCustomer = value;
                  },
                  title: S.of(context).newCustomer),
              20.verticalSpace,
              ElevatedButton(
                  onPressed: () => controller.applyFilters(),
                  child: AppText.boldText(S.of(context).applyFilters, color: Colors.white)),
              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
