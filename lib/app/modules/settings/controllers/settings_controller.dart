import 'dart:developer';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:ventigo/app/app_services/local_storage_service.dart';
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/modules/settings/controllers/file_storage.dart';
import 'package:ventigo/app/modules/settings/views/restore_dialog.dart';
import 'package:ventigo/app/routes/app_pages.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../../firebase/firebase_storage_repo.dart';
import '../../../../firebase/firestore_repositery.dart';
import '../../../../generated/l10n.dart';
import '../../dialog/dialog_functions.dart';

class SettingsController extends GetxController {
  List<DatabaseModel> databases = [];
  RxBool isLoading = false.obs;

  Future<void> createData() async {
    try {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'ventigo.sqlite'));

      // final fileName = DateTime.now().toString().split(' ')[0];
      int timeInMillis = DateTime.now().millisecondsSinceEpoch;

      // Convert to base36 (which uses 0-9 and a-z)
      String base36Id = timeInMillis.toRadixString(36);

      // Take only the last 4 characters (ensures it's always 4 chars)
      final String fileName = DateTime.now().toString().split(' ')[0] + '_(${base36Id.substring(base36Id.length - 4)})';

      final bytes = await file.readAsBytesSync();

      // await FileStorage.writeCounterBytes(bytes, 'backup_$fileName.sqlite');
      await FileStorage.saveToSpecificPath(bytes, 'backup_$fileName.sqlite');

      Get.snackbar('Exported', 'Check your file in the Downloads folder');
    } catch (e) {
      log('Error ' + e.toString());
      return;
    } finally {
      Get.closeAllSnackbars();
    }

    // var downloadUrl =
    //     await FireBaseStorageRepo().uploadFile(Get.context!, file, 'database');

    // DatabaseModel database =
    //     DatabaseModel(url: downloadUrl, createdAt: DateTime.now());
    // FireStoreRepository().addData(
    //     FireStoreRepository().collectionReference('database'),
    //     database.toMap());
  }

  Future<void> newRestoreData(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select the backup file',
      );

      if (result != null) {
        if (!result.files.first.xFile.name.contains('sqlite')) {
          Get.showSnackbar(GetSnackBar(
              message: 'Invalid file format', duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM));
          return;
        }

        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, 'ventigo.sqlite'));
        final bytes = await result.files.first.xFile.readAsBytes();
        await file.writeAsBytes(bytes);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(S.of(context).backupRestoredSuccessfully),
          duration: const Duration(seconds: 1),
          action: SnackBarAction(
            label: S.of(context).reloadApp,
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN);
              SystemNavigator.pop();
            },
          ),
        ));

        // await Future.delayed(Duration(seconds: 2), () {
        //   Get.offAllNamed(Routes.LOGIN);
        //   SystemNavigator.pop();
        // });
      } else {
        log('No file selected');
      }
    } catch (e) {
      log('Error ' + e.toString());
    } finally {
      Get.closeAllSnackbars();
    }
  }

  pushRestoreDialog() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return RestoreDialog();
        });
    await getDatabases();
  }

  Future<void> restoreData(String url, BuildContext context) async {
    Get.showSnackbar(GetSnackBar(
        message: S.of(context).restoringDatabase,
        showProgressIndicator: true,
        isDismissible: false,
        snackPosition: SnackPosition.BOTTOM));

    try {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'ventigo.sqlite'));
      await FireBaseStorageRepo().downloadFile(file, url);

      Get.showSnackbar(GetSnackBar(
          message: S.of(context).backupRestoredSuccessfully,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM));
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      log('Error ' + e.toString());
    } finally {
      Get.closeAllSnackbars();
    }
  }

  Future<void> getDatabases() async {
    isLoading.value = true;

    try {
      await FireStoreRepository().getCollectionData(databaseCollection).then((value) {
        databases = value.map((e) => DatabaseModel.fromMap(e)).toList();
      });
    } catch (e) {
      log('Error ' + e.toString());
    } finally {
      isLoading.value = false;
    }

    update();
  }

  void clearData() {
    MySharedPref.clearDisk();
    DbController.to.appDb.deleteDatabase();
  }

  Future<void> exportExpenseToCSVFile(BuildContext context) async {
    DateTime? fromDate;
    DateTime? toDate;

    bool isDataExport = false;

    await showDateRangePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(3000)).then((value) {
      if (value != null) {
        fromDate = value.start;
        toDate = value.end.add(const Duration(days: 1)).subtract(const Duration(minutes: 1));
      }
    });

    final stream = DbController.to.appDb.getAllCosts(fromDate: fromDate, toDate: toDate);
    var csvData = [
      [
        'ID',
        'Date',
        'Name',
        'Date',
        'Deduct From Tax',
        'Systematic',
        'Number of Units',
        'Units of Measurement',
        'Price',
      ]
    ];

    await stream.listen((event) async {
      event.forEach((element) {
        csvData.add([
          element.id.toString(),
          if (element.date != null) element.date!.smallDate() else '',
          element.name ?? '',
          element.date.toString(),
          element.isDeductFromTax.toString(),
          element.isSystematic.toString(),
          element.numberOfUnits.toString(),
          element.unitsOfMeasurement ?? '',
          element.price.toString(),
        ]);
      });

      final csv = const ListToCsvConverter().convert(csvData);

      // final fileName = DateTime.now().toString().split(' ')[0];
      int timeInMillis = DateTime.now().millisecondsSinceEpoch;

      // Convert to base36 (which uses 0-9 and a-z)
      String base36Id = timeInMillis.toRadixString(36);

      // Take only the last 4 characters (ensures it's always 4 chars)
      final String fileName = DateTime.now().toString().split(' ')[0] + '_(${base36Id.substring(base36Id.length - 4)})';

      await FileStorage.writeCounter(csv, 'Expenses $fileName.csv');
      Navigator.pop(context);

      Get.snackbar(S.of(context).exported, S.of(context).checkYourFileInTheDownloadsFolder);
    });
  }

  Future<void> exportDataToCSVFile(BuildContext context) async {
    DateTime? fromDate;
    DateTime? toDate;

    await showDateRangePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(3000)).then((value) {
      if (value != null) {
        fromDate = value.start;
        toDate = value.end.add(const Duration(days: 1)).subtract(const Duration(minutes: 1));
      }
    });

    final stream = DbController.to.appDb.getAllDataItems(fromDate: fromDate, toDate: toDate);
    var csvData = [
      [
        'ID',
        'Date',
        'Name',
        'Regular Customer',
        'New Customer',
        'Payment by Card',
        'Phone',
        'Employee Name',
        'Category Name',
        'Service Name',
      ]
    ];

    await stream.listen((event) async {
      event.forEach((element) {
        csvData.add([
          element.id.toString(),
          if (element.date != null) element.date!.smallDate() else '',
          element.name ?? '',
          element.regCustomer.toString(),
          element.newCustomer.toString(),
          element.cardPay.toString(),
          element.phone ?? '',
          element.employeeName ?? '',
          element.categoryName ?? '',
          element.serviceName ?? '',
        ]);
      });

      final csv = const ListToCsvConverter().convert(csvData);

      // final fileName = DateTime.now().toString().split(' ')[0];
      int timeInMillis = DateTime.now().millisecondsSinceEpoch;

      // Convert to base36 (which uses 0-9 and a-z)
      String base36Id = timeInMillis.toRadixString(36);

      // Take only the last 4 characters (ensures it's always 4 chars)
      final String fileName = DateTime.now().toString().split(' ')[0] + '_(${base36Id.substring(base36Id.length - 4)})';

      await FileStorage.writeCounter(csv, 'Data $fileName.csv');
      Navigator.pop(context);
      Get.snackbar(S.of(context).exported, S.of(context).checkYourFileInTheDownloadsFolder);
    });
  }
}

class DatabaseModel {
  final String? url;
  final DateTime? createdAt;

  DatabaseModel({this.url, this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'created_at': createdAt,
    };
  }

  factory DatabaseModel.fromMap(Map<String, dynamic> map) {
    return DatabaseModel(
      url: map['url'],
      createdAt: map['created_at'].toDate(),
    );
  }
}
