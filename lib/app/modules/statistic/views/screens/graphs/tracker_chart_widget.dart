import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../db/db_controller.dart';

class TrackerChart extends StatelessWidget {
  const TrackerChart(
      {super.key, required this.stream, this.isCostsTable = true});
  final Stream<List<SalesData>?> stream;
  final bool isCostsTable;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SalesData>?>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData ||
              snapshot.data!.isEmpty ||
              snapshot.data?.length == 1) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/place_holders/no_graph.png',
                      width: 100, height: 100),
                  SizedBox(
                    width: 250,
                    child: AppText.mediumText(
                      snapshot.data?.length == 1
                          ? S.of(context).thereIsOnlyOneCostAddedYetAddMoreTo
                          : S.of(context).noCostsAddedYet,
                      align: TextAlign.center,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            );
          }

          return FutureBuilder(
              future: DbController.to.appDb
                  .ifAllSameDate(isCostTable: isCostsTable),
              builder: (context, isSingleDate) {
                if (isSingleDate.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (isSingleDate.data == true) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/place_holders/no_graph.png',
                            width: 100, height: 100),
                        SizedBox(
                          width: 250,
                          child: AppText.mediumText(
                            S.of(context).allCostsAreAddedOnTheSameDateAddMore,
                            align: TextAlign.center,
                            color: Colors.grey[600],
                          ),
                        )
                      ],
                    ),
                  );
                }

                return Container(
                    child: SfCartesianChart(
                        primaryXAxis: DateTimeAxis(
                          title: AxisTitle(
                              text: S.of(context).date,
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.primaryColor)),
                          // name: 'Date',
                          // intervalType: DateTimeIntervalType.days,
                          // minimum:
                          //     DateTime.now().subtract(const Duration(days: 365 * 2)),
                        ),
                        primaryYAxis: NumericAxis(
                          title: AxisTitle(
                              text: isCostsTable
                                  ? S.of(context).cost
                                  : S.of(context).price,
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.primaryColor)),
                          labelFormat: '{value}',
                        ),
                        series: <CartesianSeries>[
                      LineSeries<SalesData, DateTime>(
                        dataSource: snapshot.data ??
                            [
                              SalesData(DateTime.now(), 0),
                              SalesData(DateTime.now(), 0)
                            ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                      )
                    ]));
              });
        });
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
