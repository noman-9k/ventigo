import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/constants/app_constants.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../../routes/app_pages.dart';
import '../../../common/bottom_add_logout_bar.dart';
import '../../../main/controllers/main_controller.dart';
import 'graphs/sample2_chart.dart';
import 'graphs/tracker_chart_widget.dart';
import 'tables/costs_table.dart';

class GraphicsScreen extends StatelessWidget {
  const GraphicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppConstants.defaultPadding,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  10.verticalSpace,
                  AppText.boldText('Graphical Metrics', fontSize: 20.sp),
                  LineChartSample2(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
