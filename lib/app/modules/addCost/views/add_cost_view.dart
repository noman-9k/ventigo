import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../config/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../addReport/controllers/add_report_controller.dart';
import '../../common/back_button.dart';
import '../../common/noman_search.dart';
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
      body: GetBuilder<AddCostController>(builder: (adController) {
        return SingleChildScrollView(
          child: Padding(
            padding: AppConstants.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                AppText.lightBoldText(S.of(context).nameOfExpense),
                SizedBox(height: 5),
                NomanTextFieldSearch(
                    maxLength: 25,
                    // key: ValueKey(controller.nameController),
                    label: 'Electricity, Water, Gas, etc',
                    controller: controller.nameController,
                    future: () => controller.fetchCategoriesName(),
                    getSelectedValue: (SearchItem value) => controller.onSearchItemChanged(value)),
                15.verticalSpace,
                TextField(
                        readOnly: true,
                        onTap: () => controller.categoryTab(context),
                        controller: controller.categoriesController,
                        decoration: InputDecoration(hintText: S.of(context).all + ' ' + S.of(context).categories))
                    .withLabel(S.of(context).categories),
                20.verticalSpace,
                Container(
                  height: 50,
                  width: 1.sw,
                  decoration: BoxDecoration(color: AppColors.veryLightGrey, borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      10.horizontalSpace,
                      AppText.mediumText(S.of(context).deductFromTax),
                      Spacer(),
                      RadioMenuButton(
                          value: true,
                          groupValue: adController.deductFromTax,
                          onChanged: (value) {
                            controller.deductFromTax = value;
                            controller.update();
                          },
                          child: Text(S.of(context).yes)),
                      RadioMenuButton(
                          value: false,
                          groupValue: adController.deductFromTax,
                          onChanged: (value) {
                            controller.deductFromTax = value;
                            controller.update();
                          },
                          child: Text(S.of(context).no))
                    ],
                  ),
                ),
                20.verticalSpace,
                Container(
                  height: 50,
                  width: 1.sw,
                  decoration: BoxDecoration(color: AppColors.veryLightGrey, borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      10.horizontalSpace,
                      AppText.mediumText(S.of(context).systematicExpenditure),
                      Spacer(),
                      RadioMenuButton(
                          value: true,
                          groupValue: adController.systematicExpenditure,
                          onChanged: (value) {
                            controller.systematicExpenditure = value;
                            controller.update();
                          },
                          child: Text(S.of(context).yes)),
                      RadioMenuButton(
                          value: false,
                          groupValue: adController.systematicExpenditure,
                          onChanged: (value) {
                            controller.systematicExpenditure = value;
                            controller.update();
                          },
                          child: Text(S.of(context).no))
                    ],
                  ),
                ),
                20.verticalSpace,
                GetBuilder<AddCostController>(builder: (controller) {
                  if (controller.systematicExpenditure ?? false) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.lightBoldText(S.of(context).repetitionInterval),
                        SizedBox(height: 5),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            value: [
                              S.of(context).doNotRepeat,
                              S.of(context).everyDay,
                              S.of(context).everyWeek,
                              S.of(context).everyMonth,
                              S.of(context).everyQuarter,
                              S.of(context).everyYear
                            ].contains(controller.retrievalInterval)
                                ? controller.retrievalInterval
                                : null,
                            hint: AppText.mediumText(S.of(context).repetitionInterval, color: Colors.grey),
                            items: [
                              S.of(context).doNotRepeat,
                              S.of(context).everyDay,
                              S.of(context).everyWeek,
                              S.of(context).everyMonth,
                              S.of(context).everyQuarter,
                              S.of(context).everyYear
                            ]
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: AppText.mediumText(item),
                                    ))
                                .toList(),
                            onChanged: (p0) {
                              controller.retrievalInterval = p0;

                              controller.update();

                              log(controller.retrievalInterval ?? 'No');
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: 1.sw,
                              padding: const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14), color: AppColors.veryLightGrey),
                            ),
                            iconStyleData:
                                const IconStyleData(icon: Icon(Icons.arrow_forward_ios_outlined), iconSize: 14),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 1.sw - 40,
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(14), color: AppColors.whiteColor),
                              offset: const Offset(0, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility: MaterialStateProperty.all(true),
                              ),
                            ),
                            menuItemStyleData:
                                const MenuItemStyleData(height: 40, padding: EdgeInsets.only(left: 14, right: 14)),
                          ),
                        ),
                        20.verticalSpace,
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
                TextField(
                  controller: controller.priceController,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  decoration: InputDecoration(
                    hintText: S.of(context).price,
                  ),
                  keyboardType: TextInputType.number,
                ).withLabel(S.of(context).price),
                20.verticalSpace,
                TextField(
                  controller: controller.numberOfUnits,
                  inputFormatters: [LengthLimitingTextInputFormatter(5)],
                  decoration: InputDecoration(hintText: S.of(context).numberOfUnits),
                  keyboardType: TextInputType.number,
                ).withLabel(S.of(context).numberOfUnits),
                20.verticalSpace,
                AppText.lightBoldText(S.of(context).unitOfMeasurements + S.of(context).optionally),
                SizedBox(height: 5),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    value: [
                      S.of(context).milliliters,
                      S.of(context).kwh,
                      S.of(context).kilograms,
                      S.of(context).letters,
                      S.of(context).pieces,
                      S.of(context).grams,
                      S.of(context).boxes,
                      S.of(context).noUnitOfMeasurements,
                    ].contains(controller.unitsOfMeasurement)
                        ? controller.unitsOfMeasurement
                        : null,
                    hint: AppText.mediumText(S.of(context).piecesLitersKilograms, color: Colors.grey),
                    items: [
                      S.of(context).milliliters,
                      S.of(context).kwh,
                      S.of(context).kilograms,
                      S.of(context).letters,
                      S.of(context).pieces,
                      S.of(context).grams,
                      S.of(context).boxes,
                      S.of(context).noUnitOfMeasurements,
                    ]
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: AppText.mediumText(item),
                            ))
                        .toList(),
                    onChanged: (p0) {
                      if (p0 == S.of(context).noUnitOfMeasurements) {
                        controller.unitsOfMeasurement = null;
                      } else {
                        controller.unitsOfMeasurement = p0;
                      }
                      controller.update();
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 1.sw,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(14), color: AppColors.veryLightGrey),
                    ),
                    iconStyleData: const IconStyleData(icon: Icon(Icons.arrow_forward_ios_outlined), iconSize: 14),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 1.sw - 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: AppColors.whiteColor),
                      offset: const Offset(0, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      ),
                    ),
                    menuItemStyleData:
                        const MenuItemStyleData(height: 40, padding: EdgeInsets.only(left: 14, right: 14)),
                  ),
                ),
                20.verticalSpace,
                ElevatedButton(
                    onPressed: controller.onSubmitted,
                    child: AppText.boldText(S.of(context).save, color: Colors.white)),
              ],
            ),
          ),
        );
      }),
    );
  }
}
