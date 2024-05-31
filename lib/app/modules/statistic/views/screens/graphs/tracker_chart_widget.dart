import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ventigo/config/app_text.dart';

class TrackerChart extends StatelessWidget {
  const TrackerChart({super.key, required this.stream});
  final Stream<List<SalesData>?> stream;

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
                          ? 'There is only one cost added yet add more to plot the graph'
                          : 'No Costs added yet',
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
                      // intervalType: DateTimeIntervalType.days,
                      // minimum:
                      //     DateTime.now().subtract(const Duration(days: 365 * 2)),
                      ),
                  primaryYAxis: NumericAxis(
                    // interval: 5,
                    labelFormat: '{value} /=',
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
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
