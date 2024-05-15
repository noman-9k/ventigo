import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ventigo/config/app_colors.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key, this.width, this.height, this.borderRadius = 2});
  final double? width;
  final double? height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.whiteColor.withOpacity(0.1),
      highlightColor: AppColors.primaryColor.withOpacity(0.1),
      child: Container(
        width: width ?? 200,
        height: height ?? 115,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
    );
  }
}
