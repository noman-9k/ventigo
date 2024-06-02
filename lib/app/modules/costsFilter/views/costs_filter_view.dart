import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/yes_no_button.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../config/app_text.dart';
import '../../common/back_button.dart';
import '../../common/common_price_range_slider.dart';
import '../../common/custom_dropdown.dart';
import '../controllers/costs_filter_controller.dart';

class CostsFilterView extends GetView<CostsFilterController> {
  const CostsFilterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: AppText.boldText('Costs Filter'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              controller.clearFilters();
            },
            child: Row(children: [
              AppText.mediumBoldText('Clear', color: Colors.red),
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
                  hintText: 'Name of cost',
                ),
              ).withLabel('Name of cost'),
              20.verticalSpace,
              // CustomDropDown(
              //   items: CategoryService.to
              //       .getAllServicesCategories()
              //       .map((e) => e.name)
              //       .toList(),
              //   onChanged: controller.onCategoryChanged,
              //   title: 'Select Category',
              // ),
              20.verticalSpace,
              YesNoButton(
                  defaultValue: controller.isDeductFromTax,
                  onChanged: (value) {
                    controller.isDeductFromTax = value;
                  },
                  title: 'Deduct from TAX'),
              20.verticalSpace,
              YesNoButton(
                  defaultValue: controller.isSystematicExpenditure,
                  onChanged: (value) {
                    controller.isSystematicExpenditure = value;
                  },
                  title: 'Systematic expenditure'),
              20.verticalSpace,
              CustomDropDown(
                items: [
                  'Do Not Repeat',
                  'Every Day',
                  'Every Week',
                  'Every Month',
                  'Every Quarter',
                  'Every Year'
                ],
                title: 'Repetition Interval',
                onChanged: (p0) {
                  controller.repetitionInterval = p0;
                },
              ),
              20.verticalSpace,
              CustomDropDown(
                items: [
                  'Milliliters',
                  'KW/h',
                  'Kilograms',
                  'Letters',
                  'Pieces',
                  'Grams',
                  'Boxes',
                  'No Unit of Measurements',
                ],
                title: 'Unit of measurements',
                onChanged: (p0) {
                  controller.unitOfMeasurements = p0;
                },
              ),
              20.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.mediumBoldText('Costs Price Range'),
                  10.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.minPriceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Min Price'),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: TextField(
                          controller: controller.maxPriceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Max Price'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // CommonPriceRangeSlider(
              //   title: 'Cost Price',
              //   onChanged: (RangeValues values) {
              //     print(values);
              //   },
              // ),
              20.verticalSpace,
              ElevatedButton(
                onPressed: controller.getFilteredCosts,
                child: AppText.boldText('Apply Filter', color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
