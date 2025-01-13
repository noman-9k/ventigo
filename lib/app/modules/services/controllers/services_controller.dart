import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../db/db_controller.dart';
import '../../../db/drift_db.dart';

class ServicesController extends GetxController {
  ScrollController scrollController = ScrollController();

  var key = GlobalKey<FormState>();

  static ServicesController get to => Get.find();

  List<DbCategory> dbCategories = [];
  DbCategory? selectedCategory;

  Future<List> fetchData() async {
    List<SearchItem> list = [];

    List<DbCategory> categories = await DbController.to.appDb.getAllCategoriesF();
    List<DbService> services = await DbController.to.appDb.getAllServicesF();

    categories.forEach((element) {
      list.add(SearchItem(label: element.name!, value: element.name!));
    });

    services.forEach((element) {
      list.add(SearchItem(label: element.name!, value: element.name!));
    });

    return list;
  }

  scrollToValue(String? query, {double height = 80.0}) async {
    if (query == null) return;

    int index = 0;
    dbCategories = await DbController.to.appDb.getAllCategoriesF();

    index = dbCategories.indexWhere((element) => element.name == query);

    if (index == -1) {
      DbService service = await DbController.to.appDb.getServiceByServiceName(query);

      DbCategory category = await DbController.to.appDb.getCategoryByService(service);

      index = dbCategories.indexWhere((element) => element.id == category.id);
    }
    selectCategory(index);
    update();

    scrollController.animateTo(index * height, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  deleteService(int id) {
    DbController.to.appDb.deleteService(id);
  }

  deleteCategory(int id) {
    DbController.to.appDb.deleteCategory(id);
  }

  void selectCategory(int index) {
    selectedCategory = dbCategories[index];
    update();
  }
}

class SearchItem {
  String label;
  String value;
  SearchItem({required this.label, required this.value});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(label: json['label'], value: json['value']);
  }
}
