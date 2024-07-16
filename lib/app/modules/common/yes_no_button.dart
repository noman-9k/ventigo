import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text.dart';
import '../../../generated/l10n.dart';

class YesNoButton extends StatefulWidget {
  const YesNoButton(
      {super.key,
      required this.onChanged,
      required this.title,
      this.defaultValue});
  final String title;
  final void Function(bool) onChanged;
  final bool? defaultValue;

  @override
  State<YesNoButton> createState() => _YesNoButtonState();
}

class _YesNoButtonState extends State<YesNoButton> {
  var isYes = null;

  @override
  void initState() {
    isYes = widget.defaultValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      height: 50,
      width: 1.sw,
      decoration: BoxDecoration(
          color: AppColors.veryLightGrey,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.horizontalSpace,
          AppText.mediumText(widget.title),
          Spacer(),
          Row(
            children: [
              RadioMenuButton(
                  style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                  value: true,
                  groupValue: isYes,
                  onChanged: (v) {
                    setState(() {
                      isYes = v ?? false;
                    });
                    widget.onChanged(isYes);
                  },
                  child: Text(S.of(context).yes)),
              RadioMenuButton(
                  value: false,
                  groupValue: isYes,
                  style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                  onChanged: (v) {
                    setState(() {
                      isYes = v ?? false;
                    });
                    widget.onChanged(isYes);
                  },
                  child: Text(S.of(context).no)),
            ],
          ),
          10.horizontalSpace,
        ],
      ),
    );
  }
}
