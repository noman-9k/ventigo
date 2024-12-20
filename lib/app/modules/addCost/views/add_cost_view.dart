import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/yes_no_button.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../generated/l10n.dart';
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
        title: AppText.boldText(S.of(context).addCost),
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
                  hintText: S.of(context).name,
                ),
              ).withLabel(S.of(context).nameOfExpense),
              20.verticalSpace,
              TextField(
                      readOnly: true,
                      onTap: () => controller.categoryTab(context),
                      controller: controller.categoriesController,
                      decoration: InputDecoration(hintText: S.of(context).selectCategories))
                  .withLabel(S.of(context).categories),
              20.verticalSpace,
              YesNoButton(
                  onChanged: (value) {
                    controller.deductFromTax = value;
                  },
                  title: S.of(context).deductFromTax),
              20.verticalSpace,
              YesNoButton(
                  onChanged: (value) {
                    controller.systematicExpenditure = value;
                    controller.update();
                  },
                  title: S.of(context).systematicExpenditure),
              20.verticalSpace,
              GetBuilder<AddCostController>(builder: (controller) {
                if (controller.systematicExpenditure ?? false) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.lightBoldText(S.of(context).repetitionInterval),
                      SizedBox(height: 5),
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
                          controller.retrievalInterval = p0;
                        },
                      ),
                      20.verticalSpace,
                    ],
                  );
                } else {
                  return Container();
                }
              }),
              TextField(
                controller: controller.numberOfUnits,
                decoration: InputDecoration(
                  hintText: S.of(context).numberOfUnits,
                ),
                keyboardType: TextInputType.number,
              ).withLabel(S.of(context).numberOfUnits),
              20.verticalSpace,
              TextField(
                controller: controller.priceController,
                decoration: InputDecoration(
                  hintText: S.of(context).unitPrice,
                ),
                keyboardType: TextInputType.number,
              ).withLabel(S.of(context).unitPrice),
              20.verticalSpace,
              AppText.lightBoldText(S.of(context).unitOfMeasurements),
              SizedBox(height: 5),
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
                  print(p0);
                  if (p0 == S.of(context).noUnitOfMeasurements) {
                    controller.unitsOfMeasurement = null;
                  } else {
                    controller.unitsOfMeasurement = p0;
                  }
                },
              ),
              20.verticalSpace,
              ElevatedButton(
                  onPressed: controller.onSubmitted, child: AppText.boldText(S.of(context).save, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
