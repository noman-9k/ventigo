import 'dart:io';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FireBaseStorageRepo {
  Future<String?> uploadFile(
      BuildContext context, File file, String dbRepo) async {
    try {
      // Create a reference to the Firebase Storage bucket

      firebase_storage.Reference storageRef =
          firebase_storage.FirebaseStorage.instance.ref('${dbRepo}/');

      // Generate a unique file name
      String fileName =
          DateTime.now().toIso8601String() + file.path.split('/').last;

      // Upload the file to Firebase Storage
      firebase_storage.UploadTask uploadTask =
          storageRef.child(fileName).putFile(file);

      // Get the download URL of the uploaded file
      String downloadURL = await (await uploadTask).ref.getDownloadURL();

      // Return the download URL
      return downloadURL;
    } catch (e) {
      // Handle any errors that occur during the upload process
      print('Error uploading file: $e');
      return null;
    }
  }

  Future<File?> downloadFile(File file, String s) async {
    try {
      // // Create a reference to the file to download
      firebase_storage.Reference storageRef =
          firebase_storage.FirebaseStorage.instance.refFromURL(s);

      await storageRef.writeToFile(file);

      return file;
    } catch (e) {
      // Handle any errors that occur during the download process
      print('Error downloading file: $e');
      return null;
    }
  }
}
