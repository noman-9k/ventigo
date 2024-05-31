import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/dialog/dialog_functions.dart';

import '../../../config/app_colors.dart';
import '../../routes/app_pages.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: AppColors.blueColor,
        child: IconButton(
          icon: const FaIcon(Icons.logout_outlined, color: Colors.white),
          onPressed: () => pushConfirmDialog(
            context,
            title: 'Logout',
            message: 'Are you sure? You want to logout.',
            onDone: () {
              Get.offAllNamed(Routes.LOGIN);
            },
          ),
        ),
      ),
    );
  }
}
