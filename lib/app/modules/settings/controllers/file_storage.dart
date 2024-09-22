import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// To save the file in the device
class FileStorage {
  static Future<String> getExternalDocumentPath() async {
    // To check whether permission is given for this app or not.
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // If not we will ask for permission first
      await Permission.storage.request();
    }
    Directory _directory = Directory("");
    if (Platform.isAndroid) {
      // Redirects it to download folder in android
      _directory = Directory("/storage/emulated/0/Download");
    } else {
      _directory = await getApplicationDocumentsDirectory();
    }

    final exPath = _directory.path;
    print("Saved Path: $exPath");
    await Directory(exPath).create(recursive: true);
    return exPath;
  }

  static Future<String> get _localPath async {
    // final directory = await getApplicationDocumentsDirectory();
    // return directory.path;
    // To get the external path from device of download folder
    final String directory = await getExternalDocumentPath();
    return directory;
  }

  static Future<File> writeCounter(String bytes, String name) async {
    final path = await _localPath;
    // Create a file for the path of
    // device and file name with extension
    File file = File('$path/$name');

    print("Save file");

    // Write the data in the file you have created
    return file.writeAsString(bytes);
  }

  static Future<File> writeCounterBytes(List<int> bytes, String name) async {
    final path = await _localPath;
    // Create a file for the path of
    // device and file name with extension
    File file = File('$path/$name');

    print("Save file");

    // Write the data in the file you have created
    file.writeAsBytesSync(bytes);
    return file;
  }

  static Future<bool> saveToSpecificPath(Uint8List bytes, String name) async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    Get.showSnackbar(GetSnackBar(
        message: 'Creating database...',
        showProgressIndicator: true,
        isDismissible: false,
        snackPosition: SnackPosition.BOTTOM));
    String? outputFile = await FilePicker.platform
        .saveFile(dialogTitle: 'Save Your File to desired location', fileName: name, bytes: bytes);
    if (outputFile == null) {
      return false;
    }

    log('File Saved: $outputFile');

    // try {
    //   File returnedFile = File('$outputFile');
    //   returnedFile.writeAsBytesSync(bytes);
    //   return true;
    // } catch (e) {
    //   log(e.toString());
    // }

    return true;
  }
}
