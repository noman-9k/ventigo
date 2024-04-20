import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/models/caregory.dart';

import '../../dialog/dialog_functions.dart';

class AddEmployeeController extends GetxController {
  List<Category> selectedCategories = [];

  categoryTab(BuildContext context) {
    pushCategorySelectDialog(
      context,
      categories: CategoryService.to.servicesCategories,
      selectedCategories: selectedCategories,
      onDone: (categories) {
        selectedCategories = categories ?? [];
        update();
      },
    );
  }
}
