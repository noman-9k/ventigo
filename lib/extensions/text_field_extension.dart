// write code for extension on test field that add the textfield in a column with a label

import 'package:flutter/material.dart';
import 'package:ventigo/config/app_text.dart';

extension TextFieldExtension on TextField {
  Widget withLabel(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.lightBoldText(label),
        // Text(label,style: ,),
        SizedBox(height: 5),
        this,
      ],
    );
  }
}
