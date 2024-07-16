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

class SettingsController extends GetxController {
  List<DatabaseModel> databases = [];
  RxBool isLoading = false.obs;

  Future<void> createData() async {
    try {
      Get.showSnackbar(GetSnackBar(
          message: 'Creating database...',
          showProgressIndicator: true,
          isDismissible: false,
          snackPosition: SnackPosition.BOTTOM));

      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'ventigo.sqlite'));

      final fileName = DateTime.now().toString().split(' ')[0];

      final bytes = await file.readAsBytesSync();

      await FileStorage.writeCounterBytes(bytes, 'backup_$fileName.sqlite');
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
              message: 'Invalid file format',
              duration: Duration(seconds: 2),
              snackPosition: SnackPosition.BOTTOM));
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
      await FireStoreRepository()
          .getCollectionData(databaseCollection)
          .then((value) {
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

  Future<void> exportToCSVFile(BuildContext context) async {
    final stream = DbController.to.appDb.getAllDataItems();
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

      final fileName = DateTime.now().toString().split(' ')[0];

      await FileStorage.writeCounter(csv, '$fileName.csv');
      Get.snackbar(S.of(context).exported,
          S.of(context).checkYourFileInTheDownloadsFolder);
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
