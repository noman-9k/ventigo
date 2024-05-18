import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';

import '../../../routes/app_pages.dart';
import '../views/screens/graphs/tracker_chart_widget.dart';

class StatisticController extends GetxController {
  void logout() {
    Get.offAllNamed(Routes.LOGIN);
  }

  Stream<List<SalesData>?> getSalesChartData() async* {
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
    var allServices = DbController.to.appDb.getAllDataItems();

    return allServices.map((services) {
      var salesData = <SalesData>[];
      for (var service in services) {
        salesData
            .add(SalesData(service.date ?? DateTime.now(), service.price!));
      }
      return salesData;
    });
  }
}
