import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_styles.dart';
import '../../../config/app_text.dart';

class TwoTabsView extends StatefulWidget {
  const TwoTabsView({super.key, required this.tabNames, required this.widgets});
  final List<String> tabNames;
  final List<Widget> widgets;

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
        60.verticalSpace,
        Container(
          margin: EdgeInsets.only(top: 10.h),
          height: 60.h,
          decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(90.0.r)),
          child: Container(
            margin: EdgeInsets.all(6.h),
            width: 300.w,
            child: TabBar(
                dividerColor: Colors.transparent,
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(90.r),
                  color: AppColors.primaryColor,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                labelStyle: AppStyles.mediumStyle(),
                unselectedLabelColor: AppColors.whiteColor,
                unselectedLabelStyle: AppStyles.lightStyle(),
                tabs: widget.tabNames
                    .map(
                      (e) => Tab(
                        child:
                            AppText.mediumText(e, color: AppColors.whiteColor),
                      ),
                    )
                    .toList()),
          ),
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
