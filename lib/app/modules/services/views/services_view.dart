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
        title: AppText.boldText('Services', fontSize: 20.sp),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return snapshot.hasData
                      ? ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => 5.verticalSpace,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Theme(
                              data: ThemeData(
                                splashColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                              ),
                              child: ExpansionTile(
                                title: AppText.boldText(
                                    snapshot.data![index].name!),
                                expandedCrossAxisAlignment:
                                    CrossAxisAlignment.start,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                childrenPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                backgroundColor:
                                    AppColors.veryLightPrimaryColor,
                                collapsedBackgroundColor:
                                    AppColors.veryLightGrey,
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
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      height: 40,
                                      width: 1.sw,
                                      decoration: BoxDecoration(
                                        color: AppColors.veryLightGrey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child:
                                          AppText.mediumBoldText('Services')),
                                  StreamBuilder<List<DbService>>(
                                    stream: DbController.to.appDb
                                        .getServicesByCategory(
                                            snapshot.data![index].id),
                                    builder: (context, snapshot) => snapshot
                                            .hasData
                                        ? ListView.separated(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            separatorBuilder:
                                                (context, index) =>
                                                    Divider(height: 1),
                                            shrinkWrap: true,
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (context, i) {
                                              return ListTile(
                                                  contentPadding:
                                                      EdgeInsets.zero,
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
                                                          snapshot
                                                              .data![i].name!),
                                                  subtitle:
                                                      AppText.mediumBoldText(
                                                    'Price: ' +
                                                        snapshot.data![i].price
                                                            .toString(),
                                                    fontSize: 15,
                                                  ),
                                                  trailing: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () =>
                                                            pushEditServiceDialog(
                                                                context,
                                                                snapshot
                                                                    .data![i],
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
                                                          title:
                                                              'Delete Service',
                                                          message:
                                                              'Are you sure you want to delete this service?',
                                                          onDone: () => controller
                                                              .deleteService(
                                                                  snapshot
                                                                      .data![i]
                                                                      .id),
                                                        ),
                                                        icon: Icon(
                                                            Icons
                                                                .delete_outline_outlined,
                                                            color: AppColors
                                                                .redColor),
                                                      ),
                                                    ],
                                                  ));
                                            },
                                          )
                                        : Text('No data'),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Text('No data');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
