import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/app_services/category_service.dart';
import 'package:ventigo/app/db/tables/tables.dart';

import '../../../models/caregory.dart';

class ServicesController extends GetxController {
  ScrollController scrollController = ScrollController();

  var key = GlobalKey<FormState>();

  static ServicesController get to => Get.find();

  List<DbCategories> dbCategories = [];

  Future<List> fetchData() async {
    await Future.delayed(Duration(milliseconds: 1));
    return getservicesSearchList();
  }

  List<SearchItem> getservicesSearchList() {
    return CategoryService.to.servicesCategories
        .map((e) => SearchItem(label: e.name, value: e))
        .toList();
  }

  scrollToValue(Category? service, {double height = 100.0}) {
    if (service == null) return;
    int index = CategoryService.to.servicesCategories.indexOf(service);
    scrollController.animateTo(index * height,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}

class SearchItem {
  String label;
  Category value;
  SearchItem({required this.label, required this.value});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(label: json['label'], value: json['value']);
  }
}
