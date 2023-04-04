import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reddit_clone/core/typedef.dart';

import '../failure.dart';
import 'firebase_providers.dart';

final storageRepositoryProvider = Provider((ref) {
  return StorageRepositoryProvider(firebaseStorage: ref.watch(storageProvider));
});

class StorageRepositoryProvider {
  final FirebaseStorage _firebaseStorage;

  StorageRepositoryProvider({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  FutureEither<String> storeFile(
      {required String path, required String id, required File? file}) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(id);
      UploadTask uploadTask = ref.putFile(file!);
      final snapshot = await uploadTask;
      return right(await snapshot.ref.getDownloadURL());
    } catch (e) {
      return left(
        Failure(
          e.toString(),
        ),
      );
    }
  }
}
