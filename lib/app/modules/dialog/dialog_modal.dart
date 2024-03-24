import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogModel extends StatelessWidget {
  const DialogModel({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        insetPadding: EdgeInsets.all(16),
        children: [
          Container(
            width: 1.sw,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: child,
          )
        ]);
  }
}
