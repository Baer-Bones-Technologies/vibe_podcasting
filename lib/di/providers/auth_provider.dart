import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/models/vibe_user.dart';
import '../../src/features/authentication/auth_manager.dart';
import '../../src/repository/auth_repo.dart';
import 'database_provider.dart';

final authStateProvider =
    StreamProvider<User?>((ref) => FirebaseAuth.instance.authStateChanges());

final authManagerProvider = Provider<AuthManager>((ref) => AuthManager(
      AuthRepository(
        ref.read(firebaseAuthProvider),
      ),
      ref.read(databaseManagerProvider),
    ));

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final StateProvider<VibeUser?> vibeUserProvider = StateProvider<VibeUser?>((ref) => null);