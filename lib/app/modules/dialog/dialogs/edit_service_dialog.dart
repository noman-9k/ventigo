import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';
import 'package:ventigo/extensions/text_field_extension.dart';

import '../dialog_modal.dart';

class EditServiceDialog extends StatefulWidget {
  const EditServiceDialog(
      {super.key, required this.onDone, required this.service});
  final Function(String?) onDone;
  final DbService service;

  @override
  State<EditServiceDialog> createState() => _EditServiceDialogState();
}

class _EditServiceDialogState extends State<EditServiceDialog> {
  late TextEditingController serviceNameController;
  late TextEditingController priceController;

  @override
  void initState() {
    serviceNameController = TextEditingController(text: widget.service.name);
    priceController =
        TextEditingController(text: widget.service.price.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dialogBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
        inputDecorationTheme: InputDecorationTheme(
          alignLabelWithHint: true,
          fillColor: AppColors.veryLightGrey,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.transparent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.transparent)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
        ),
      ),
      child: DialogModel(
        child: Column(
          children: [
            AppText.boldText('Edit Service'),
            16.verticalSpace,
            TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: serviceNameController,
              decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(12),
                  //     borderSide: const BorderSide(color: Colors.transparent)),
                  // enabledBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(12),
                  //     borderSide: const BorderSide(color: Colors.transparent)),
                  ),
            ).withLabel('Service Name'),
            16.verticalSpace,
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(12),
                  //     borderSide: const BorderSide(color: Colors.transparent)),
                  // enabledBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(12),
                  //     borderSide: const BorderSide(color: Colors.transparent)),
                  ),
            ).withLabel('Price'),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDone(widget.service.name);

                    var newService = widget.service.copyWith(
                      name: drift.Value(serviceNameController.text),
                      price: drift.Value(double.parse(priceController.text)),
                    );

                    DbController.to.appDb.updateService(newService);

                    Navigator.pop(context);
                  },
                  child: Text('Done'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
