import 'package:camera/camera.dart';

import '../../../constants/domain/storage_path.dart';
import '../../repository/database_repo.dart';

class DatabaseManager {
  const DatabaseManager(this._database);

  final DatabaseRepository _database;

  Future<String> addToDatabase(XFile file, StoragePath path, String uid) async {
   return await _database.uploadFile(file, '${path.name}/$uid');
  }

  Future<void> deleteFromDatabase(String url) async {
    await _database.deleteFile(url);
  }

  Future<void> deleteMultipleFromDatabase(List<String> urls) async {
    await _database.deleteFiles(urls);
  }

  Future<void> deleteFolderFromDatabase(StoragePath path) async {
    await _database.deleteFolder(path);
  }
}
// Path: lib/src/features/database/database_repository.dart