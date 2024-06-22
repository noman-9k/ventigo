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

import '../../../../generated/l10n.dart';
import '../../../constants/app_images.dart';
import '../../common/app_search_field.dart';
import '../../common/svg_icon.dart';
import '../../dialog/dialog_functions.dart';
import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LogoutButton(),
        title: AppText.boldText(S.of(context).services, fontSize: 20.sp),
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
                        S.of(context).noServicesFoundnpleaseAddANewService,
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
                          label: S.of(context).search,
                          fetchData: () => controller.fetchData(),
                          getSelectedValue: (SearchItem value) =>
                              controller.scrollToValue(value.value),
                        ),
                        20.verticalSpace,
                        AppText.boldText(S.of(context).categories),
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
                                    key: ValueKey(snapshot.data![index].id),
                                    category: snapshot.data![index],
                                    isSelected: selectedCat != null &&
                                        selectedCat.id ==
                                            snapshot.data![index].id),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  )
                : Text(S.of(context).noData);
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
        iconColor: AppColors.primaryColor,
        collapsedIconColor: AppColors.primaryColor,
        initiallyExpanded: isSelected,
        title: AppText.mediumBoldText(category.name!),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        childrenPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        backgroundColor: isSelected
            ? AppColors.veryLightPrimaryColor.withOpacity(0.3)
            : AppColors.veryLightPrimaryColor.withOpacity(0.1),
        collapsedBackgroundColor: isSelected
            ? AppColors.veryLightPrimaryColor.withOpacity(0.4)
            : AppColors.veryLightPrimaryColor.withOpacity(0.2),
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => pushEditCategoryDialog(context, category),
              icon: SvgIcon(icon: AppImages.edit_ic, size: 23),
              // Icon(Icons.edit, color: AppColors.primaryColor, size: 20),
            ),
            5.horizontalSpace,
            IconButton(
              onPressed: () => pushConfirmDialog(
                context,
                title: S.of(context).deleteCategory,
                message: S.of(context).areYouSureYouWantToDeleteThisCategory,
                onDone: () => controller.deleteCategory(category.id),
              ),
              icon: SvgIcon(icon: AppImages.delete, size: 22),
              // Icon(Icons.delete_outline_outlined,
              //     size: 20, color: AppColors.redColor),
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
                              S.of(context).name + snapshot.data![i].name!,
                              fontSize: 14),
                          subtitle: AppText.mediumText(
                            S.of(context).price +
                                snapshot.data![i].price.toString(),
                            fontSize: 14,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => pushEditServiceDialog(
                                    context, snapshot.data![i], (value) {}),
                                icon:
                                    SvgIcon(icon: AppImages.edit_ic, size: 23),
                              ),
                              1.horizontalSpace,
                              IconButton(
                                onPressed: () => pushConfirmDialog(
                                  context,
                                  title: S.of(context).deleteService,
                                  message: S
                                      .of(context)
                                      .areYouSureYouWantToDeleteThisService,
                                  onDone: () => controller
                                      .deleteService(snapshot.data![i].id),
                                ),
                                icon: SvgIcon(icon: AppImages.delete, size: 25),
                              ),
                            ],
                          ));
                    },
                  )
                : Text(S.of(context).noData),
          ),
        ],
      );
    });
  }
}
