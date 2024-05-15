import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibe_podcasting/repository/auth.dart';

import '../features/authentication/auth.dart';

final authStateProvider = StreamProvider<User?>((ref)=> FirebaseAuth.instance.authStateChanges());

final authManagerProvider = Provider<AuthManager>((ref) => AuthManager(AuthRepository()));