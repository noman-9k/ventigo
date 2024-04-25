import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/app_colors.dart';

class BottomAddLogoutBar extends StatelessWidget {
  const BottomAddLogoutBar({super.key, this.logout, this.add});
  final Function()? logout;
  final Function()? add;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
      child: ClipRect(
        child: BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.blueColor,
                child: IconButton(
                  icon:
                      const FaIcon(Icons.logout_outlined, color: Colors.white),
                  onPressed: logout,
                ),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.blueColor,
                child: IconButton(
                  icon:
                      const FaIcon(FontAwesomeIcons.plus, color: Colors.white),
                  onPressed: add,
                  // () => Get.toNamed(Routes.ADD_REPORT),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
