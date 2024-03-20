import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ventigo/config/app_text.dart';

import '../../../../config/app_colors.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TabItem> navItems = [
      TabItem(title: 'Setings', icon: FontAwesomeIcons.gear),
      TabItem(title: 'Statistic', icon: FontAwesomeIcons.chartLine),
      TabItem(title: 'Services', icon: FontAwesomeIcons.servicestack),
      TabItem(title: 'Filters', icon: FontAwesomeIcons.filter),
      TabItem(title: 'Employes', icon: FontAwesomeIcons.users),
    ];
    List<Widget> _widgetOptions = <Widget>[
      Center(child: AppText.lightText('Setings')),
      Center(child: AppText.lightText('Statistic')),
      Center(child: AppText.lightText('Services')),
      Center(child: AppText.lightText('Filters')),
      Center(child: AppText.lightText('Employes')),
    ];

    return Scaffold(
      bottomNavigationBar: BottomBarInspiredOutside(
        items: navItems,
        backgroundColor: AppColors.primaryColor,
        color: Colors.white,
        colorSelected: AppColors.whiteColor,
        iconSize: 20,
        itemStyle: ItemStyle.hexagon,
        indexSelected: _currentIndex,
        countStyle:
            CountStyle(background: AppColors.primaryColor, color: Colors.white),
        chipStyle: ChipStyle(background: AppColors.primaryColor),
        titleStyle: const TextStyle(fontSize: 14, color: Colors.black),
        onTap: (int index) => onTapped(index),
        top: -25,
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: _widgetOptions[_currentIndex],
    );
  }
}

class NavItem {
  final String title;
  final IconData icon;
  int? index;

  NavItem({
    required this.title,
    required this.icon,
    this.index,
  });
}
