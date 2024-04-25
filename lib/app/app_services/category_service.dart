import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';

import '../models/caregory.dart';
import '../models/service.dart';

class CategoryService extends GetxService {
  static CategoryService get to => Get.find();

  RxList<DbCategory> servicesCategories = <DbCategory>[].obs;

  Future<List<DbCategory>> getAllServicesCategories() async {
    return await DbController.to.appDb.getCategoriesAsList();
  }
}
