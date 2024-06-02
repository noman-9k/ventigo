import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';

import '../../../routes/app_pages.dart';
import '../views/screens/graphs/tracker_chart_widget.dart';

class StatisticController extends GetxController {
  void logout() {
    Get.offAllNamed(Routes.LOGIN);
  }

  Stream<List<SalesData>?> getCostsChartData() async* {
    var allCosts = DbController.to.appDb.getAllCosts();

    await for (var costs in allCosts) {
      var salesData = <SalesData>[];
      for (var cost in costs) {
        salesData.add(SalesData(cost.date ?? DateTime.now(), cost.price!));
      }
      yield salesData;
    }
  }

  Stream<List<SalesData>?> getReportsChartData() {
    var allSales = DbController.to.appDb.getAllDataItems();

    return allSales.map((sales) {
      var salesData = <SalesData>[];
      for (var sale in sales) {
        salesData.add(SalesData(sale.date ?? DateTime.now(), sale.price!));
      }
      return salesData;
    });
  }
}
