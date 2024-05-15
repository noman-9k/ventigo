import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/yes_no_button.dart';
import 'package:ventigo/config/app_text.dart';

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
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: Column(
          children: [
            20.verticalSpace,
            TextField(
              decoration: InputDecoration(
                hintText: 'Name of expense',
                labelText: 'Name of expense',
              ),
            ),
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Number of Units',
                labelText: 'Number of Units',
              ),
            ),
            20.verticalSpace,
            TextField(
              decoration: InputDecoration(
                hintText: 'Unit Price',
                labelText: 'Unit Price',
              ),
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
            ElevatedButton(
                onPressed: () {},
                child: AppText.boldText('Save', color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
