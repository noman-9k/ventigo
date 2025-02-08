import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/yes_no_button.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../config/app_text.dart';
import '../../../../generated/l10n.dart';
import '../../common/back_button.dart';
import '../../common/common_price_range_slider.dart';
import '../../common/custom_dropdown.dart';
import '../controllers/costs_filter_controller.dart';
import 'widgets/costs_dates_section.dart';

class CostsFilterView extends GetView<CostsFilterController> {
  const CostsFilterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: AppText.boldText(S.of(context).costsFilter),
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
              TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: controller.nameController,
                decoration: InputDecoration(
                  hintText: S.of(context).nameOfCost,
                ),
              ).withLabel(S.of(context).nameOfCost),
              20.verticalSpace,
              YesNoButton(
                  defaultValue: controller.isDeductFromTax,
                  onChanged: (value) {
                    controller.isDeductFromTax = value;
                  },
                  title: S.of(context).deductFromTax),
              20.verticalSpace,
              YesNoButton(
                  defaultValue: controller.isSystematicExpenditure,
                  onChanged: (value) {
                    controller.isSystematicExpenditure = value;
                  },
                  title: S.of(context).systematicExpenditure),
              20.verticalSpace,
              CustomDropDown(
                items: [
                  S.of(context).doNotRepeat,
                  S.of(context).everyDay,
                  S.of(context).everyWeek,
                  S.of(context).everyMonth,
                  S.of(context).everyQuarter,
                  S.of(context).everyYear
                ],
                title: S.of(context).repetitionInterval,
                onChanged: (p0) {
                  controller.repetitionInterval = p0;
                },
              ),
              20.verticalSpace,
              CustomDropDown(
                items: [
                  S.of(context).milliliters,
                  S.of(context).kwh,
                  S.of(context).kilograms,
                  S.of(context).letters,
                  S.of(context).pieces,
                  S.of(context).grams,
                  S.of(context).boxes,
                  S.of(context).noUnitOfMeasurements,
                ],
                title: S.of(context).unitOfMeasurements,
                onChanged: (p0) {
                  controller.unitOfMeasurements = p0;
                },
              ),
              20.verticalSpace,
              CostsDateSection(),
              20.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.mediumBoldText(S.of(context).costsPriceRange),
                  10.verticalSpace,
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
              20.verticalSpace,
              ElevatedButton(
                onPressed: controller.getFilteredCosts,
                child: AppText.boldText(S.of(context).applyFilter, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
