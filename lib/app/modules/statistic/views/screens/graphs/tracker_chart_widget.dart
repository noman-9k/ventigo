import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrackerChart extends StatelessWidget {
  const TrackerChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime.now().subtract(Duration(days: 2010)), 1),
      SalesData(DateTime.now().subtract(Duration(days: 2011)), 3),
      SalesData(DateTime.now().subtract(Duration(days: 2012)), 5),
      SalesData(DateTime.now().subtract(Duration(days: 2013)), 4),
      SalesData(DateTime.now().subtract(Duration(days: 2014)), 8)
    ];

    return Expanded(
      child: Container(
          child: SfCartesianChart(
              primaryXAxis:
                  DateTimeAxis(dateFormat: DateFormat.yMd(), interval: 10),
              primaryYAxis: NumericAxis(
                interval: 2,
                labelFormat: '{value} mg',
              ),
              series: <CartesianSeries>[
            LineSeries<SalesData, DateTime>(
              dataSource: chartData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
            )
          ])),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
