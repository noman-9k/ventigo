import 'dart:math';

import 'package:get/get.dart';

import '../../../models/caregory.dart';
import '../../../models/service.dart';
import '../../../routes/app_pages.dart';
import '../../statistic/controllers/table_data.dart';

class MainController extends GetxController {
  List<TableItem> tableItems = [];

  static MainController get to => Get.find();

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
        typeOfService: AppService(
            name: 'Service $i', price: random.nextInt(100).toDouble()),
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

// }


//     with GetSingleTickerProviderStateMixin {
//   late TabController tabController;

//   var selectedTab;

//   @override
//   void onInit() {
//     tabController = TabController(length: 2, vsync: this);
//     super.onInit();
//   }

  ///
  ///
  ///
  ///
  ///
// }
