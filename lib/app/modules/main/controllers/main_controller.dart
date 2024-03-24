import 'dart:math';

import 'package:get/get.dart';

import '../../../models/service.dart';
import '../../../models/caregory.dart';
import '../../../routes/app_pages.dart';
import 'table_data.dart';

class MainController extends GetxController {
  List<TableItem> tableItems = [];

  @override
  void onInit() {
    initData(100);
    super.onInit();
  }

  void initData(int size) {
    tableItems.clear();
    final random = Random();
    for (int i = 0; i < size; i++) {
      tableItems.add(TableItem(
        customerData: "User_$i",
        date: DateTime.now().subtract(Duration(days: i)),
        category: Category(name: 'Category $i', services: []),
        typeOfService:
            Service(name: 'Service $i', price: random.nextInt(100).toDouble()),
        price: random.nextInt(100).toString(),
        total: random.nextInt(100).toString(),
        isNewCustomer: random.nextBool(),
        percentage: random.nextInt(100).toString(),
        cardPay: random.nextBool(),
      ));
    }
  }

  void logout() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
