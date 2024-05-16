import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../constants/domain/storage_path.dart';

class DatabaseRepository{
  DatabaseRepository();

  final _storage = FirebaseStorage.instance;

  Future<String> uploadFile(XFile file, String path) async {
    final ref = _storage.ref(path).child('images/${file.name}');
    await ref.putFile(File(file.path));
    return await ref.getDownloadURL();
  }

  Future<void> deleteFile(String url) async {
    await _storage.refFromURL(url).delete();
  }

Future<void> deleteFiles(List<String> urls) async {
    for (final url in urls) {
      await deleteFile(url);
    }
  }

  Future<void> deleteFolder(StoragePath path) async {
    await _storage.ref(path.name).delete();
  }
}