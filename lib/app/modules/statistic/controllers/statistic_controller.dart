import 'package:get/get.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/modules/statistic/views/screens/results/controler/new_statistics_results_controller.dart';

import '../../../routes/app_pages.dart';
import '../views/screens/graphs/tracker_chart_widget.dart';

class StatisticController extends GetxController {
  void logout() {
    Get.offAllNamed(Routes.LOGIN);
  }

  Stream<List<SalesData>?> getCostsChartData() async* {
    final fromDate = NewStatisticsResultsController.to.fromDate?.value;
    final toDate = NewStatisticsResultsController.to.toDate?.value;

    var allCosts = DbController.to.appDb
        .getAllDataItems(fromDate: fromDate, toDate: toDate);

    await for (var costs in allCosts) {
      var salesData = <SalesData>[];
      for (var cost in costs) {
        final serviceCost =
            await DbController.to.appDb.getPriceByServiceId(cost.serviceId);

        salesData.add(SalesData(cost.date ?? DateTime.now(), serviceCost));
      }
      yield salesData;
    }
  }

  Stream<List<SalesData>?> getReportsChartData() {
    final fromDate = NewStatisticsResultsController.to.fromDate?.value;
    final toDate = NewStatisticsResultsController.to.toDate?.value;

    var allSales = DbController.to.appDb
        .getAllDataItems(fromDate: fromDate, toDate: toDate);

    return allSales.map((sales) {
      var salesData = <SalesData>[];
      for (var sale in sales) {
        salesData.add(SalesData(sale.date ?? DateTime.now(), sale.price!));
      }
      return salesData;
    });
  }
}
