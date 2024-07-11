import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/config/app_enums.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../generated/l10n.dart';
import '../../common/back_button.dart';
import '../controllers/add_employe_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  const AddEmployeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: AppBackButton(),
          title: AppText.boldText(S.of(context).addEmployee),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppConstants.defaultPadding,
            child: GetBuilder<AddEmployeeController>(builder: (controller) {
              return Column(
                children: [
                  TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: controller.nameController,
                          decoration: InputDecoration(
                              hintText: S.of(context).enterYourName))
                      .withLabel(S.of(context).name),
                  10.verticalSpace,
                  TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: controller.lastNameController,
                      decoration: InputDecoration(
                        hintText: S.of(context).enterYourLastName,
                      )).withLabel(S.of(context).lastName),
                  10.verticalSpace,
                  TextField(
                      controller: controller.loginController,
                      decoration: InputDecoration(
                        hintText: S.of(context).enterYourLogin,
                      )).withLabel(S.of(context).login),
                  10.verticalSpace,
                  TextField(
                      controller: controller.passController,
                      decoration: InputDecoration(
                        hintText: S.of(context).enterYourPassword,
                      )).withLabel(S.of(context).password),
                  10.verticalSpace,
                  AppText.mediumText(
                      S.of(context).selectCategoriesFromTheListnmaybeSeveral,
                      align: TextAlign.center),
                  10.verticalSpace,
                  TextField(
                          readOnly: true,
                          onTap: () => controller.categoryTab(context),
                          controller: controller.categoriesController,
                          decoration: InputDecoration(
                              hintText: S.of(context).selectCategories))
                      .withLabel(S.of(context).categories),
                  10.verticalSpace,
                  AppText.mediumText(
                      S.of(context).setPercentageOfIncomeIfNecessary,
                      align: TextAlign.center),
                  5.verticalSpace,
                  TextField(
                    controller: controller.percentageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: S.of(context).setPercentageOfIncome),
                  ).withLabel(S.of(context).percentage),
                  10.verticalSpace,
                  AppText.mediumText(
                      S.of(context).visibilityLevelWithACrossFromTheList,
                      align: TextAlign.center),
                  10.verticalSpace,
                  _checkbox(
                      title: S.of(context).employeePercentage,
                      type: VisibilityFilter.percentage),
                  10.verticalSpace,
                  _checkbox(
                      title: S.of(context).totalPercentagePerMonth,
                      type: VisibilityFilter.percentageMonth),
                  10.verticalSpace,
                  _checkbox(
                      title: S.of(context).amountPercentagePerDay,
                      type: VisibilityFilter.percentageDay),
                  10.verticalSpace,
                  _checkbox(
                      title: S.of(context).numberOfServiceForMonth,
                      type: VisibilityFilter.numberOfServices),
                  10.verticalSpace,
                  _checkbox(
                      title: S.of(context).showPhone,
                      type: VisibilityFilter.showPhone),
                  10.verticalSpace,
                  _checkbox(
                      title: S.of(context).totalPriceServicePerDay,
                      type: VisibilityFilter.servicesPerDay),
                  24.verticalSpace,
                  ElevatedButton(
                    onPressed: () => controller.saveEmployee(),
                    child: AppText.boldText(S.of(context).saveEmployee,
                        color: Colors.white),
                  ),
                ],
              );
            }),
          ),
        ));
  }

  _checkbox({required String title, required VisibilityFilter type}) {
    return SizedBox(
      child: CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          dense: true,
          tileColor: Color(0xFFECECEC),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          value: controller.trueFilters.contains(type),
          onChanged: (value) {
            controller.onVisibilityFilterChange(type, value!);
          },
          title: AppText.mediumText(title, maxLines: 1)),
    );
  }
}
