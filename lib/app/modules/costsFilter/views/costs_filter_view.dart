import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/yes_no_button.dart';

import '../../../../config/app_text.dart';
import '../../../app_services/category_service.dart';
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
          centerTitle: true),
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Name of cost',
                labelText: 'Name of cost',
              ),
            ),
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
            YesNoButton(onChanged: (_) {}, title: 'Deduct from TAX'),
            20.verticalSpace,
            YesNoButton(onChanged: (_) {}, title: 'Systematic expenditure'),
            20.verticalSpace,
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
                print(p0);
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
                print(p0);
              },
            ),
            20.verticalSpace,
            CommonPriceRangeSlider(
              title: 'Cost Price',
              onChanged: (RangeValues values) {
                print(values);
              },
            ),
            20.verticalSpace,
            ElevatedButton(
              onPressed: controller.applyFilter,
              child: AppText.boldText('Apply Filter', color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
