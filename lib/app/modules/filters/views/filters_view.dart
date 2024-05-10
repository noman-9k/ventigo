import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/yes_no_button.dart';
import 'package:ventigo/app/modules/filters/views/widgets/masters_selection.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../common/back_button.dart';
import '../controllers/filters_controller.dart';
import 'widgets/categories_section.dart';
import 'widgets/date_section.dart';
import 'widgets/services_section.dart';

class FiltersView extends GetView<FiltersController> {
  const FiltersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: AppText.boldText('Filters', fontSize: 20.sp),
        centerTitle: true,
      ),
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.verticalSpace,
              Divider(indent: 20, endIndent: 20),
              YesNoButton(onChanged: (_) {}, title: 'Regular Customer'),
              10.verticalSpace,
              YesNoButton(onChanged: (_) {}, title: 'Card Pay'),
              Divider(indent: 20, endIndent: 20),
              10.verticalSpace,
              TextField(decoration: InputDecoration()).withLabel('Name'),
              10.verticalSpace,
              TextField(decoration: InputDecoration()).withLabel('Phone'),
              10.verticalSpace,
              Divider(indent: 20, endIndent: 20),
              10.verticalSpace,
              MastersSelection(),
              10.verticalSpace,
              DateSection(),
              10.verticalSpace,
              CategoriesSection(),
              10.verticalSpace,
              ServicesSection(),
              10.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.boldText('Price Range', fontSize: 20.sp),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Min Price'),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Max Price'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // PriceRangeSlider(),
              10.verticalSpace,
              YesNoButton(onChanged: (_) {}, title: 'New Customer'),
              20.verticalSpace,
              ElevatedButton(
                  onPressed: () => controller.applyFilters(),
                  child:
                      AppText.boldText('Apply Filters', color: Colors.white)),
              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
