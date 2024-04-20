import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeCheckbox extends StatefulWidget {
  const EmployeeCheckbox(
      {super.key, required this.text, required this.onChanged});
  final String text;
  final Function(bool) onChanged;

  @override
  State<EmployeeCheckbox> createState() => _EmployeeCheckboxState();
}

class _EmployeeCheckboxState extends State<EmployeeCheckbox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        value = !value;
        setState(() {});
        widget.onChanged(!value);
        log('${widget.text} = value: $value');
      },
      child: Container(
        height: 50,
        width: 1.sw,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 14, right: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: Color(0xFFECECEC)),
        child: Row(
          children: [
            Text(widget.text),
            const Spacer(),
            IgnorePointer(
              child: Checkbox(value: value, onChanged: (_) {}),
            )
          ],
        ),
      ),
    );
  }
}
