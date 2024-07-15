import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../src/features/database/database_manager.dart';
import '../../src/repository/auth_repo.dart';
import '../../src/repository/database_repo.dart';
import '../di/providers/auth_provider.dart';
import '../di/providers/database_provider.dart';
import '../src/features/authentication/auth_manager.dart';
import 'firebase_options.dart';

class Bootstrapper {
  final _home = 'localhost';
  Future<ProviderContainer> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    if (kDebugMode) {
      try {
        FirebaseFirestore.instance.useFirestoreEmulator(_home, 8080);
        FirebaseAuth.instance.useAuthEmulator(_home, 9099);
        FirebaseStorage.instance.useStorageEmulator(_home, 9199);
        FirebaseDatabase.instance.useDatabaseEmulator(_home, 9000);
      } catch (e) {
        //ignore: avoid_print
        print(e);
      }
    }

    final container = ProviderContainer(overrides: [
      databaseRepositoryProvider.overrideWith((ref) => DatabaseRepository()),
      databaseManagerProvider.overrideWith(
          (ref) => DatabaseManager(ref.read(databaseRepositoryProvider))),
      firebaseAuthProvider.overrideWith((ref) => FirebaseAuth.instance),
      authStateProvider.overrideWith(
          (ref) => ref.watch(firebaseAuthProvider).authStateChanges()),
      authManagerProvider.overrideWith((ref) => AuthManager(
            AuthRepository(
              ref.read(firebaseAuthProvider),
            ),
            ref.read(databaseManagerProvider),
          )),
      vibeUserProvider
          .overrideWith((ref) => ref.read(authManagerProvider).loadUser()),
    ]);
    return container;
  }
}
