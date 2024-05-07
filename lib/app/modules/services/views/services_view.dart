import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';
import 'package:ventigo/app/routes/app_pages.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';

import '../../common/app_search_field.dart';
import '../../common/back_button.dart';
import '../../dialog/dialog_functions.dart';
import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: AppText.boldText('Services'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        // actions: [
        //   FaIcon(FontAwesomeIcons.gears,
        //       size: 20, color: AppColors.primaryColor),
        //   20.horizontalSpace,
        // ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () => Get.toNamed(Routes.ADD_SERVICE),
          child: FaIcon(FontAwesomeIcons.plus, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.verticalSpace,
              AppSearchField(
                label: 'Search',
                fetchData: () => controller.fetchData(),
                getSelectedValue: (SearchItem value) =>
                    controller.scrollToValue(value.value),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppText.boldText('Categories'),
                  AppText.boldText('Type of Service'),
                ],
              ),
              10.verticalSpace,
              StreamBuilder<List<DbCategory>>(
                stream: DbController.to.appDb.getAllCategories(),
                builder: (context, snapshot) => snapshot.hasData
                    ? ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => 5.verticalSpace,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title:
                                AppText.boldText(snapshot.data![index].name!),
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            childrenPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            backgroundColor: AppColors.veryLightPrimaryColor,
                            collapsedBackgroundColor: AppColors.veryLightGrey,
                            collapsedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () => pushEditCategoryDialog(
                                      context,
                                      snapshot.data![index],
                                      (value) {}),
                                  icon: Icon(Icons.edit,
                                      color: AppColors.primaryColor),
                                ),
                                5.horizontalSpace,
                                IconButton(
                                  onPressed: () => pushConfirmDialog(
                                    context,
                                    title: 'Delete Category',
                                    message:
                                        'Are you sure you want to delete this category?',
                                    onDone: () => controller.deleteCategory(
                                        snapshot.data![index].id),
                                  ),
                                  icon: Icon(Icons.delete_outline_outlined,
                                      color: AppColors.redColor),
                                ),
                                5.horizontalSpace,
                                Icon(Icons.keyboard_arrow_down_rounded)
                              ],
                            ),
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: AppText.mediumBoldText('Services')),
                              StreamBuilder<List<DbService>>(
                                stream: DbController.to.appDb
                                    .getServicesByCategory(
                                        snapshot.data![index].id),
                                builder: (context, snapshot) => snapshot.hasData
                                    ? ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        separatorBuilder: (context, index) =>
                                            Divider(),
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, i) {
                                          return ListTile(
                                              tileColor:
                                                  AppColors.veryLightGrey,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              onLongPress: () =>
                                                  pushEditServiceDialog(
                                                      context,
                                                      snapshot.data![i],
                                                      (value) {}),
                                              title: AppText.mediumBoldText(
                                                  'Name: ' +
                                                      snapshot.data![i].name!),
                                              subtitle: AppText.mediumBoldText(
                                                'Price: ' +
                                                    snapshot.data![i].price
                                                        .toString(),
                                                fontSize: 15,
                                              ),
                                              trailing: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                    onPressed: () =>
                                                        pushEditServiceDialog(
                                                            context,
                                                            snapshot.data![i],
                                                            (value) {}),
                                                    icon: Icon(Icons.edit,
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                  5.horizontalSpace,
                                                  IconButton(
                                                    onPressed: () =>
                                                        pushConfirmDialog(
                                                      context,
                                                      title: 'Delete Service',
                                                      message:
                                                          'Are you sure you want to delete this service?',
                                                      onDone: () => controller
                                                          .deleteService(
                                                              snapshot
                                                                  .data![i].id),
                                                    ),
                                                    icon: Icon(
                                                        Icons
                                                            .delete_outline_outlined,
                                                        color:
                                                            AppColors.redColor),
                                                  ),
                                                ],
                                              ));
                                        },
                                      )
                                    : Text('No data'),
                              ),
                            ],
                          );
                        },
                      )

                    // ExpansionTile(
                    //     title: AppText.boldText(snapshot.data.toString()),
                    //   )
                    : Text('No data'),
              ),
              // Obx(() {
              //   return Expanded(
              //     child: ListView.builder(
              //       controller: controller.scrollController,
              //       itemCount: CategoryService.to.servicesCategories.length,
              //       itemBuilder: (context, index) {
              //         if (CategoryService.to.servicesCategories[index].name ==
              //             'Add New Category') {
              //           return Container();
              //         }
              //         return Padding(
              //           padding: const EdgeInsets.symmetric(vertical: 4),
              //           child: ExpansionTile(
              //             title: AppText.boldText(
              //                 CategoryService.to.servicesCategories[index].name),
              //             children: [
              //               ListView.builder(
              //                 shrinkWrap: true,
              //                 itemCount: CategoryService
              //                     .to.servicesCategories[index].services?.length,
              //                 itemBuilder: (context, i) {
              //                   return ListTile(
              //                     title: Row(
              //                       crossAxisAlignment: CrossAxisAlignment.center,
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: [
              //                         40.horizontalSpace,
              //                         AppText.mediumText(CategoryService
              //                                 .to
              //                                 .servicesCategories[index]
              //                                 .services?[i]
              //                                 .name ??
              //                             ''),
              //                         10.horizontalSpace,
              //                         Icon(FontAwesomeIcons.chevronRight,
              //                             size: 10,
              //                             color: AppColors.primaryColor),
              //                       ],
              //                     ),
              //                     trailing: AppText.mediumText((CategoryService
              //                                 .to
              //                                 .servicesCategories[index]
              //                                 .services?[i]
              //                                 .price ??
              //                             '')
              //                         .toString()),
              //                   );
              //                 },
              //               ),
              //             ],
              //           ),
              //         );
              //       },
              //     ),
              //   );
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
