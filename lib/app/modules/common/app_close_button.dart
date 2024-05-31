import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ventigo/app/modules/dialog/dialog_functions.dart';

import '../../../config/app_colors.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: AppColors.blueColor,
      child: IconButton(
        onPressed: () => pushConfirmDialog(
          context,
          title: 'Exit',
          message: 'Are you sure? You want to exit the app.',
          onDone: () {
            SystemNavigator.pop();
          },
        ),
        icon:
            Icon(Icons.logout_outlined, color: AppColors.whiteColor, size: 30),
      ),
    );
  }
}
