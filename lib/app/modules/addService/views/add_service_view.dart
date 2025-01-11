import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../../../../config/app_styles.dart';
import '../../../../generated/l10n.dart';
import '../../common/back_button.dart';
import '../../common/custom_dropdown.dart';
import '../controllers/add_service_controller.dart';

class AddServiceView extends GetView<AddServiceController> {
  const AddServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => controller.getAll(),
      //   child: Icon(Icons.arrow_forward),
      // ),
      appBar: AppBar(leading: AppBackButton(), title: AppText.boldText(S.of(context).addService), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText.mediumText(S.of(context).createOrSelectACategory),
              16.verticalSpace,
              GetBuilder<AddServiceController>(builder: (controller) {
                return StreamBuilder(
                    stream: DbController.to.appDb.getAllCategories(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CustomDropDown(
                          items: snapshot.data!.map((e) => e.name!).toList(),
                          onChanged: controller.onCategoryChanged,
                          title: S.of(context).selectCategory,
                        );
                      }
                      return CircularProgressIndicator();
                    });
              }),
              10.verticalSpace,
              AppText.mediumText(S.of(context).orCreateANewCategory),
              10.verticalSpace,
              TextField(
                style: TextStyle(fontSize: 14.sp),
                textCapitalization: TextCapitalization.sentences,
                // onTap: controller.addNewCategory,
                // readOnly: true,
                inputFormatters: [LengthLimitingTextInputFormatter(29)],
                onChanged: (value) => controller.categoryLength.value = value.length,
                controller: controller.categoryNameController,
                decoration: InputDecoration(
                  hintText: S.of(context).enterCategoryName,
                ),
              ).withLabel(S.of(context).categoryName),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() {
                    return Text(
                      S.of(context).characters + ' ${controller.categoryLength.value}/29 ',
                      style: AppStyles.lightStyle(),
                    );
                  }),
                ],
              ),
              32.verticalSpace,
              AppText.mediumText(S.of(context).nameOfTheService),
              10.verticalSpace,
              TextField(
                style: TextStyle(fontSize: 14.sp),
                textCapitalization: TextCapitalization.sentences,
                controller: controller.serviceNameController,
                onChanged: (value) => controller.serviceLength.value = value.length,
                inputFormatters: [LengthLimitingTextInputFormatter(29)],
                decoration: InputDecoration(hintText: S.of(context).enterServiceName),
              ).withLabel(S.of(context).serviceName),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() {
                    return Text(
                      S.of(context).characters + ' ${controller.serviceLength.value}/29 ',
                      style: AppStyles.lightStyle(),
                    );
                  }),
                ],
              ),
              32.verticalSpace,
              AppText.mediumText(S.of(context).costOfMaterialsForThisServices),
              10.verticalSpace,
              TextField(
                style: TextStyle(fontSize: 16.sp),
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: S.of(context).enterPrice),
              ).withLabel(S.of(context).price),
              32.verticalSpace,
              ElevatedButton(
                onPressed: controller.dbAddService,
                child: AppText.boldText(S.of(context).addService, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
