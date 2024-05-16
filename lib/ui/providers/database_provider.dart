import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibe_podcasting/src/repository/database_repo.dart';

import '../../src/features/database/database_manager.dart';

final databaseRepositoryProvider = Provider((ref) => DatabaseRepository());
final databaseManagerProvider = Provider((ref) => DatabaseManager(ref.read(databaseRepositoryProvider)));