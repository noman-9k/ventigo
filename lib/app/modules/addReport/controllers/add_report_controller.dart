import 'package:get/get.dart';
import 'package:ventigo/app/models/caregory.dart';
import 'package:ventigo/app/models/service.dart';

import '../../../app_services/category_service.dart';

class AddReportController extends GetxController {
  List<Category> categories = [];
  // CategoryService.to.servicesCategories;

  List<AppService> selectedCategoryServices = [];
  Category? selectedCategory;
  AppService? selectedService;

  void submit() {
    Get.back();
  }

  onCategoryChanged(String? p1) {
    selectedService = null;
    update();
    selectedCategory = categories.firstWhere((element) => element.name == p1);
    selectedCategoryServices = selectedCategory?.services ?? [];
    update();
  }

  onServiceChanged(String? p1) {
    // selectedService =
    //     selectedCategoryServices?.firstWhere((element) => element.name == p1);

    update();
  }
}
