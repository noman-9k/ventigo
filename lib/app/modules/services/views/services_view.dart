import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';
import 'package:ventigo/app/modules/common/logout_button.dart';
import 'package:ventigo/app/routes/app_pages.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';

import '../../common/app_search_field.dart';
import '../../dialog/dialog_functions.dart';
import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LogoutButton(),
        title: AppText.boldText('Services', fontSize: 20.sp),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () => Get.toNamed(Routes.ADD_SERVICE),
          child: FaIcon(FontAwesomeIcons.plus, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: StreamBuilder<List<DbCategory>>(
          stream: DbController.to.appDb.getAllCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data!.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/place_holders/categories.png',
                      height: 100.h, width: 100.w),
                  20.verticalSpace,
                  Center(
                    child: AppText.mediumText(
                        'No Services Found\nPlease add a new service',
                        align: TextAlign.center,
                        color: AppColors.lightGrey),
                  ),
                  90.verticalSpace,
                ],
              );
            }

            return snapshot.hasData
                ? SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.verticalSpace,
                        AppSearchField(
                          label: 'Search',
                          fetchData: () => controller.fetchData(),
                          getSelectedValue: (SearchItem value) =>
                              controller.scrollToValue(value.value),
                        ),
                        20.verticalSpace,
                        AppText.boldText('Categories'),
                        10.verticalSpace,
                        GetBuilder<ServicesController>(builder: (controller) {
                          DbCategory? selectedCat = controller.selectedCategory;

                          return ListView.separated(
                            key: Key('builder ${selectedCat?.id.toString()}'),
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                5.verticalSpace,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Theme(
                                data: ThemeData(
                                  splashColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                child: CustomExpansionTile(
                                    category: snapshot.data![index]),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  )
                : Text('No data');
          },
        ),
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile(
      {super.key, this.isSelected = false, required this.category});
  final bool isSelected;
  final DbCategory category;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServicesController>(builder: (controller) {
      return ExpansionTile(
        key: ValueKey(category.id),
        title: AppText.mediumBoldText(category.name!),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        childrenPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        backgroundColor: AppColors.veryLightPrimaryColor.withOpacity(0.1),
        collapsedBackgroundColor: isSelected
            ? Colors.red
            : AppColors.veryLightPrimaryColor.withOpacity(0.2),
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => pushEditCategoryDialog(context, category),
              icon: Icon(Icons.edit, color: AppColors.primaryColor),
            ),
            5.horizontalSpace,
            IconButton(
              onPressed: () => pushConfirmDialog(
                context,
                title: 'Delete Category',
                message: 'Are you sure you want to delete this category?',
                onDone: () => controller.deleteCategory(category.id),
              ),
              icon: Icon(Icons.delete_outline_outlined,
                  color: AppColors.redColor),
            ),
            5.horizontalSpace,
            Icon(Icons.keyboard_arrow_down_rounded)
          ],
        ),
        children: [
          Divider(height: 1),
          StreamBuilder<List<DbService>>(
            stream: DbController.to.appDb.getServicesByCategory(category.id),
            builder: (context, snapshot) => snapshot.hasData
                ? ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Divider(height: 1),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                          contentPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onLongPress: () => pushEditServiceDialog(
                              context, snapshot.data![i], (value) {}),
                          title: AppText.mediumText(
                              'Name: ' + snapshot.data![i].name!,
                              fontSize: 14),
                          subtitle: AppText.mediumText(
                            'Price: ' + snapshot.data![i].price.toString(),
                            fontSize: 14,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => pushEditServiceDialog(
                                    context, snapshot.data![i], (value) {}),
                                icon: Icon(Icons.edit,
                                    size: 20, color: AppColors.primaryColor),
                              ),
                              5.horizontalSpace,
                              IconButton(
                                onPressed: () => pushConfirmDialog(
                                  context,
                                  title: 'Delete Service',
                                  message:
                                      'Are you sure you want to delete this service?',
                                  onDone: () => controller
                                      .deleteService(snapshot.data![i].id),
                                ),
                                icon: Icon(Icons.delete_outline_outlined,
                                    size: 20, color: AppColors.redColor),
                              ),
                            ],
                          ));
                    },
                  )
                : Text('No data'),
          ),
        ],
      );
    });
  }
}
