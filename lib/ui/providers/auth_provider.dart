import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/models/vibe_user.dart';
import '../../src/features/authentication/auth_manager.dart';
import '../../src/repository/auth_repo.dart';


final authStateProvider =
    StreamProvider<User?>((ref) => FirebaseAuth.instance.authStateChanges());

final authManagerProvider = Provider<AuthManager>(
    (ref) => AuthManager(AuthRepository(ref.read(firebaseAuthProvider))));

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final vibeUserProvider = StateProvider<VibeUser?>((ref) => null);