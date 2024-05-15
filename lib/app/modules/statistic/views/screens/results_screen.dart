import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../common/bottom_add_logout_bar.dart';
import '../../../common/two_tabs_view.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TwoTabsView(
      isSmall: true,
      tabNames: ["Costs", "Reports"],
      widgets: [
        Center(child: Text('Costs')),
        Center(child: Text('Reports')),
      ],
    );
  }
}
