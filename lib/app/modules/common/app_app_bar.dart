import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ventigo/app/modules/common/logout_button.dart';

import '../../../config/app_text.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({super.key, required this.title, this.leading});
  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: [
        LogoutButton(),
      ],
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Spacer(),
            CircleAvatar(child: FaIcon(FontAwesomeIcons.users, size: 20)),
            const SizedBox(width: 10),
            AppText.boldText(title),
            Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
