import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventigo/app/modules/dialog/dialog_modal.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../controllers/settings_controller.dart';

class RestoreDialog extends GetView<SettingsController> {
  const RestoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogModel(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.boldText('Select the database to restore', fontSize: 20),
          const SizedBox(height: 10),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.databases.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.restore),
                    title: AppText.mediumBoldText(
                        'Date: ${controller.databases[index].createdAt?.smallDateWithTime()}'),
                    onTap: () {
                      controller.restoreData(controller.databases[index].url!);
                    },
                  );
                },
              );
            }
          }),
        ],
      ),
    );
  }
}
