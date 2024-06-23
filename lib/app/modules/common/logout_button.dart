import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/constants/app_images.dart';
import 'package:ventigo/app/modules/dialog/dialog_functions.dart';

import '../../../config/app_colors.dart';
import '../../../generated/l10n.dart';
import '../../routes/app_pages.dart';
import 'svg_icon.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.transparent,
        child: IconButton(
          // icon: SvgIcon(icon: AppImages.logout_ic),
          icon: SvgIcon(icon: AppImages.logout_ic),
          //  const FaIcon(Icons.logout_outlined, color: Colors.white),
          onPressed: () => pushConfirmDialog(
            context,
            title: S.of(context).logout,
            message: S.of(context).areYouSureYouWantToLogout,
            onDone: () {
              Get.offAllNamed(Routes.LOGIN);
            },
          ),
        ),
      ),
    );
  }
}
