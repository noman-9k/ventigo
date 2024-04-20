import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/config/app_text.dart';

class CommonPriceRangeSlider extends StatefulWidget {
  const CommonPriceRangeSlider(
      {super.key, this.onChanged, required this.title});

  final Function(RangeValues)? onChanged;
  final String title;

  @override
  State<CommonPriceRangeSlider> createState() => _CommonPriceRangeSliderState();
}

class _CommonPriceRangeSliderState extends State<CommonPriceRangeSlider> {
  RangeValues values = const RangeValues(0, 1000);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.boldText(
            '${widget.title} ( ${values.start.toStringAsFixed(0)} - ${values.end.toStringAsFixed(0)} )'),
        10.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.mediumText(values.start.toStringAsFixed(0),
                  fontSize: 16.sp),
              AppText.mediumText(values.end.toStringAsFixed(0),
                  fontSize: 16.sp),
            ],
          ),
        ),
        RangeSlider(
            values: values,
            min: 0,
            max: 1000,
            divisions: 100,
            onChanged: (value) {
              values = value;
              widget.onChanged!(value);

              setState(() {});
            }),
      ],
    );
  }
}
