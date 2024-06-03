import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ventigo/app/modules/dialog/dialog_functions.dart';

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
              title: 'Exit',
              message: 'Are you sure? You want to exit the app.',
              onDone: () {
                SystemNavigator.pop();
              },
            ),
            child: Text('Exit App', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
