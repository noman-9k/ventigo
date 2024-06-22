import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ventigo/app/modules/dialog/dialog_functions.dart';

import '../../../generated/l10n.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () => pushConfirmDialog(
              context,
              title: S.of(context).exit,
              message: S.of(context).areYouSureYouWantToExitTheApp,
              onDone: () {
                SystemNavigator.pop();
              },
            ),
            child: Text(S.of(context).exitApp, style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
