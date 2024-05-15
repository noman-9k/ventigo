import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_styles.dart';
import '../../../config/app_text.dart';

class TwoTabsView extends StatefulWidget {
  const TwoTabsView(
      {super.key,
      required this.tabNames,
      required this.widgets,
      this.topCenterWidget,
      this.onFilterPressed,
      this.showFilter = false,
      this.isSmall = false});
  final List<String> tabNames;
  final List<Widget> widgets;
  final Widget? topCenterWidget;
  final bool showFilter;
  final bool isSmall;
  final Function(int)? onFilterPressed;

  @override
  State<TwoTabsView> createState() => _TwoTabsViewState();
}

class _TwoTabsViewState extends State<TwoTabsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        if (widget.topCenterWidget != null) widget.topCenterWidget!,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (widget.showFilter) 1.verticalSpace,
            Container(
              margin: EdgeInsets.only(top: 10.h),
              height: widget.isSmall ? 45.h : 55.h,
              decoration: BoxDecoration(
                  color: AppColors.veryLightBlue,
                  borderRadius: BorderRadius.circular(90.0.r)),
              child: Container(
                margin: EdgeInsets.all(6.h),
                width: widget.isSmall ? 200.w : 270.w,
                child: TabBar(
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(90.r),
                      color: AppColors.blueColor,
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    labelStyle: AppStyles.mediumStyle(),
                    unselectedLabelColor: AppColors.whiteColor,
                    unselectedLabelStyle: AppStyles.lightStyle(),
                    tabs: widget.tabNames
                        .map(
                          (e) => Tab(
                            child: AppText.mediumText(e, color: Colors.black),
                          ),
                        )
                        .toList()),
              ),
            ),
            if (widget.showFilter)
              IconButton(
                  // onPressed: () => Get.toNamed(Routes.COSTS_FILTER),
                  onPressed: () {
                    if (widget.onFilterPressed != null)
                      widget.onFilterPressed!(_tabController.index);
                  },
                  icon: Icon(FontAwesomeIcons.list))
          ],
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: widget.widgets,
          ),
        ),
      ],
    );
  }
}
