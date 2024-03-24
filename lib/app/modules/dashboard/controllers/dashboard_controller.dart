import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../config/app_text.dart';
import '../../main/views/main_view.dart';
import '../../services/views/services_view.dart';
import '../../statistic/views/statistic_view.dart';

class DashboardController extends GetxController {
  List<TabItem> navItems = [
    TabItem(title: 'Setings', icon: FontAwesomeIcons.gear),
    TabItem(title: 'Statistic', icon: FontAwesomeIcons.chartLine),
    TabItem(title: 'Filters', icon: FontAwesomeIcons.filter),
    TabItem(title: 'Services', icon: FontAwesomeIcons.gears),
    TabItem(title: 'Employes', icon: FontAwesomeIcons.users),
  ];
  List<Widget> widgetOptions = <Widget>[
    Center(child: AppText.lightText('Setings')),
    StatisticView(),
    MainView(),
    ServicesView(),
    Center(child: AppText.lightText('Employes')),
  ];

  RxInt currentIndex = 2.obs;

  onTapped(value) {
    currentIndex.value = value;
  }
}
