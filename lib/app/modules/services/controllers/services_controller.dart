import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/db/tables/tables.dart';

import '../../../db/db_controller.dart';
import '../../../db/drift_db.dart';

class ServicesController extends GetxController {
  ScrollController scrollController = ScrollController();

  var key = GlobalKey<FormState>();

  static ServicesController get to => Get.find();

  List<DbCategories> dbCategories = [];

  Future<List> fetchData() async {
    List<SearchItem> list = [];

    await DbController.to.appDb.getAllCategoriesF().then((value) {
      log('fetchData: ${value.length}');
      value.forEach((element) {
        list.add(SearchItem(label: element.name!, value: element));
      });
    });

    return list;
  }

  List<SearchItem> getservicesSearchList() {
    List<SearchItem> list = [];
    for (var item in CategoryService.to.servicesCategories) {
      list.add(SearchItem(label: item.name!, value: item));
    }
    return list;
  }

  scrollToValue(DbCategory? service, {double height = 50.0}) {
    if (service == null) return;
    int index = CategoryService.to.servicesCategories.indexOf(service);
    scrollController.animateTo(index * height,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  deleteService(int id) {
    DbController.to.appDb.deleteService(id);
  }

  deleteCategory(int id) {
    DbController.to.appDb.deleteCategory(id);
  }
}

class SearchItem {
  String label;
  DbCategory value;
  SearchItem({required this.label, required this.value});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(label: json['label'], value: json['value']);
  }
}
