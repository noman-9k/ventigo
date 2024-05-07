import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/db/drift_db.dart';
import 'package:ventigo/app/modules/dialog/dialog_modal.dart';
import 'package:ventigo/config/app_text.dart';

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
    return DialogModel(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          AppText.boldText('Edit Service'),
          16.verticalSpace,
          TextField(
            controller: serviceNameController,
            decoration: InputDecoration(
              labelText: 'Service Name',
              border: InputBorder.none,
            ),
          ),
          16.verticalSpace,
          TextField(
            controller: priceController,
            decoration: InputDecoration(
              labelText: 'Price',
              border: InputBorder.none,
            ),
          ),
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
                    name: Value(serviceNameController.text),
                    price: Value(double.parse(priceController.text)),
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
    );
  }
}

// children: [
//         AppText.boldText('Edit Service'),
//         16.verticalSpace,
//         TextField(
//           controller: serviceNameController,
//           decoration: InputDecoration(
//             labelText: 'Service Name',
//             border: InputBorder.none,
//           ),
//         ),
//         16.verticalSpace,
//         TextField(
//           controller: priceController,
//           decoration: InputDecoration(
//             labelText: 'Price',
//             border: InputBorder.none,
//           ),
//         ),
//         16.verticalSpace,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 widget.onDone(widget.service.name);

//                 var newService = widget.service.copyWith(
//                   name: Value(serviceNameController.text),
//                   price: Value(double.parse(priceController.text)),
//                 );

//                 DbController.to.appDb.updateService(newService);

//                 Navigator.pop(context);
//               },
//               child: Text('Done'),
//             ),
//           ],
//         ),
//       ],
