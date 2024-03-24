import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/modules/common/yes_no_button.dart';

import '../controllers/filters_controller.dart';

class FiltersView extends GetView<FiltersController> {
  const FiltersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
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
              TextField(decoration: InputDecoration(labelText: 'Name')),
              10.verticalSpace,
              TextField(decoration: InputDecoration(labelText: 'Phone')),
              10.verticalSpace,
              Divider(indent: 20, endIndent: 20),
            ],
          ),
        ),
      ),
    );
  }
}
