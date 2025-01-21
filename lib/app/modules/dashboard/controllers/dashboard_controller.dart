import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/employees/views/employees_view.dart';

import '../../../../generated/l10n.dart';
import '../../../app_services/purchase_service.dart';
import '../../statistic/views/statistic_view.dart';
import '../../services/views/services_view.dart';
import '../../settings/views/settings_view.dart';
import '../../main/views/main_view.dart';

class DashboardController extends GetxController {
  List<TabItem> navItems = [
    TabItem(title: S.current.settings, icon: FontAwesomeIcons.gear),
    TabItem(title: S.current.statistic, icon: FontAwesomeIcons.chartLine),
    TabItem(title: S.current.filters, icon: FontAwesomeIcons.filter),
    TabItem(title: S.current.services, icon: FontAwesomeIcons.gears),
    TabItem(title: S.current.employees, icon: FontAwesomeIcons.users),
  ];
  List<Widget> widgetOptions = <Widget>[
    SettingsView(),
    StatisticsView(),
    MainView(),
    ServicesView(),
    EmployeesView(),
  ];

  RxInt currentIndex = 2.obs;

  onTapped(value) async {
    if (value == 1) {
      if (!await PurchaseService.to.isPurchased()) {
        await PurchaseService.to.checkSubscription();

        currentIndex.value = 2;
      } else {
        currentIndex.value = value;
      }
    } else {
      currentIndex.value = value;
    }

    update();
  }
}
