import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference databaseCollection =
    FirebaseFirestore.instance.collection('database');

class FireStoreRepository {
  Future<String?> addData(CollectionReference collectionReference,
      Map<String, dynamic> data) async {
    final DocumentReference documentReference = collectionReference.doc();

    data['id'] = documentReference.id;

    try {
      await documentReference.set(data);
      return documentReference.id;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // void deleteData(
  //     CollectionReference<Object?> collectionReference, String documentId) {
  //   collectionReference.doc(documentId).delete();
  // }

  // Future<bool> updateData(CollectionReference<Object?> collectionReference,
  //     String documentId, Map<String, dynamic> data) async {
  //   try {
  //     await collectionReference.doc(documentId).update(data);
  //     return true;
  //   } catch (e) {
  //     log(e.toString());
  //     return false;
  //   }
  // }

  Future<List<Map<String, dynamic>>> getCollectionData(
      CollectionReference<Object?> collectionReference) async {
    final QuerySnapshot<Object?> querySnapshot =
        await collectionReference.orderBy('created_at', descending: true).get();

    return querySnapshot.docs
        .map((QueryDocumentSnapshot<Object?> e) =>
            e.data() as Map<String, dynamic>)
        .toList();
  }

  CollectionReference<Object?> collectionReference(String s) {
    return FirebaseFirestore.instance.collection(s);
  }
}
