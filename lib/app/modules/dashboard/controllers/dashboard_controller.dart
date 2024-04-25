import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/employees/views/employees_view.dart';

import '../../main/views/main_view.dart';
import '../../services/views/services_view.dart';
import '../../settings/views/settings_view.dart';
import '../../statistic/views/statistic_view.dart';

class DashboardController extends GetxController {
  List<TabItem> navItems = [
    TabItem(title: 'Settings', icon: FontAwesomeIcons.gear),
    TabItem(title: 'Statistic', icon: FontAwesomeIcons.chartLine),
    TabItem(title: 'Filters', icon: FontAwesomeIcons.filter),
    TabItem(title: 'Services', icon: FontAwesomeIcons.gears),
    TabItem(title: 'Employees', icon: FontAwesomeIcons.users),
  ];
  List<Widget> widgetOptions = <Widget>[
    SettingsView(),
    StatisticView(),
    MainView(),
    ServicesView(),
    EmployeesView(),
  ];

  RxInt currentIndex = 2.obs;

  onTapped(value) {
    currentIndex.value = value;
  }
}
