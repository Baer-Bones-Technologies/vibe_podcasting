import 'package:firebase_storage/firebase_storage.dart';

class DatabaseRepository{
  const DatabaseRepository();

  final _storage = FirebaseStorage.instance;

  Future<String> uploadFile(XFile file) async {
    final ref = _storage.ref().child('images/${file.name}');
    await ref.putFile(file
}