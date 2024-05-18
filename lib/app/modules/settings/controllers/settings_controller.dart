import 'dart:developer';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/modules/settings/controllers/file_storage.dart';
import 'package:ventigo/app/modules/settings/views/restore_dialog.dart';
import 'package:ventigo/app/routes/app_pages.dart';

import '../../../../firebase/firebase_storage_repo.dart';
import '../../../../firebase/firestore_repositery.dart';

class SettingsController extends GetxController {
  List<DatabaseModel> databases = [];
  RxBool isLoading = false.obs;

  Future<void> createData() async {
    Get.showSnackbar(GetSnackBar(
        message: 'Creating database...',
        showProgressIndicator: true,
        isDismissible: false,
        snackPosition: SnackPosition.BOTTOM));

    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ventigo.sqlite'));

    var downloadUrl =
        await FireBaseStorageRepo().uploadFile(Get.context!, file, 'database');

    DatabaseModel database =
        DatabaseModel(url: downloadUrl, createdAt: DateTime.now());
    FireStoreRepository().addData(
        FireStoreRepository().collectionReference('database'),
        database.toMap());

    Get.closeAllSnackbars();
  }

  pushRestoreDialog() async {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return RestoreDialog();
        });
    await getDatabases();
  }

  Future<void> restoreData(String url) async {
    Get.showSnackbar(GetSnackBar(
        message: 'Restoring database...',
        showProgressIndicator: true,
        isDismissible: false,
        snackPosition: SnackPosition.BOTTOM));

    try {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'ventigo.sqlite'));
      await FireBaseStorageRepo().downloadFile(file, url);

      Get.showSnackbar(GetSnackBar(
          message: 'Backup restored successfully!',
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
    DbController.to.appDb.deleteDatabase();
  }

  Future<void> exportToCSVFile() async {
    final stream = DbController.to.appDb.getAllDataItems();
    var csvData = [
      ['ID', 'Name', 'Phone', 'Price', 'Employee Name']
    ];

    await stream.listen((event) async {
      event.forEach((element) {
        csvData.add([
          element.id.toString(),
          element.name ?? '',
          element.phone ?? '',
          element.price.toString(),
          element.employeeName ?? ''
        ]);
      });

      final csv = const ListToCsvConverter().convert(csvData);

      FileStorage.writeCounter(csv, 'data2.csv');
      Get.snackbar('Exported', 'Check your file in the Downloads folder');
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
