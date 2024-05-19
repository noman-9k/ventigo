import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/yes_no_button.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../common/back_button.dart';
import '../../common/custom_dropdown.dart';
import '../controllers/add_cost_controller.dart';

class AddCostView extends GetView<AddCostController> {
  const AddCostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: AppText.boldText('Add Cost'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: controller.nameController,
                decoration: InputDecoration(
                  hintText: 'Name ',
                ),
              ).withLabel('Name of expense'),
              20.verticalSpace,
              TextField(
                      readOnly: true,
                      onTap: () => controller.categoryTab(context),
                      controller: controller.categoriesController,
                      decoration:
                          InputDecoration(hintText: 'Select categories'))
                  .withLabel('Categories'),
              20.verticalSpace,
              YesNoButton(
                  onChanged: (value) {
                    controller.deductFromTax = value;
                  },
                  title: 'Deduct from TAX'),
              20.verticalSpace,
              YesNoButton(
                  onChanged: (value) {
                    controller.systematicExpenditure = value;
                  },
                  title: 'Systematic expenditure'),
              20.verticalSpace,
              AppText.lightBoldText('Repetition Interval'),
              SizedBox(height: 5),
              CustomDropDown(
                items: [
                  'Every Day',
                  'Every Week',
                  'Every Month',
                  'Every Quarter',
                  'Every Year',
                  'Do Not Repeat'
                ],
                title: 'Repetition Interval',
                onChanged: (p0) {
                  controller.retrievalInterval = p0;
                },
              ),
              20.verticalSpace,
              TextField(
                controller: controller.numberOfUnits,
                decoration: InputDecoration(
                  hintText: 'Number of Units',
                ),
              ).withLabel('Number of Units'),
              20.verticalSpace,
              TextField(
                controller: controller.priceController,
                decoration: InputDecoration(
                  hintText: 'Unit Price',
                ),
              ).withLabel('Unit Price'),
              20.verticalSpace,
              AppText.lightBoldText('Unit of measurements'),
              SizedBox(height: 5),
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
                  print(p0);
                  controller.unitsOfMeasurement = p0;
                },
              ),
              20.verticalSpace,
              ElevatedButton(
                  onPressed: controller.onSubmitted,
                  child: AppText.boldText('Save', color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
