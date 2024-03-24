import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/app/routes/app_pages.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';

import '../../common/app_search_field.dart';
import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText.boldText('Services'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          FaIcon(FontAwesomeIcons.gears,
              size: 20, color: AppColors.primaryColor),
          20.horizontalSpace,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_SERVICE),
        child: FaIcon(FontAwesomeIcons.plus),
      ),
      body: Padding(
        padding: AppConstants.defaultPadding,
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
                AppText.boldText('Type of Servis'),
              ],
            ),
            10.verticalSpace,
            Obx(() {
              return Expanded(
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: CategoryService.to.servicesCategories.length,
                  itemBuilder: (context, index) {
                    if (CategoryService.to.servicesCategories[index].name ==
                        'Add New Category') {
                      return Container();
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ExpansionTile(
                        title: AppText.boldText(
                            CategoryService.to.servicesCategories[index].name),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: CategoryService
                                .to.servicesCategories[index].services?.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    40.horizontalSpace,
                                    AppText.mediumText(CategoryService
                                            .to
                                            .servicesCategories[index]
                                            .services?[i]
                                            .name ??
                                        ''),
                                    10.horizontalSpace,
                                    Icon(FontAwesomeIcons.chevronRight,
                                        size: 10,
                                        color: AppColors.primaryColor),
                                  ],
                                ),
                                trailing: AppText.mediumText((CategoryService
                                            .to
                                            .servicesCategories[index]
                                            .services?[i]
                                            .price ??
                                        '')
                                    .toString()),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
