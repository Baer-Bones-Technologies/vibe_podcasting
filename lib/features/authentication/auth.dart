import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vibe_podcasting/models/content_preferences.dart';
import 'package:vibe_podcasting/models/download_preferences.dart';
import 'package:vibe_podcasting/models/notification_preferences.dart';
import 'package:vibe_podcasting/models/playback_preferences.dart';

import '../../models/user_preferences.dart';
import '../../models/vibe_user.dart';
import '../../repository/auth.dart';

class AuthManager {
  AuthManager(this._authRepository);

  final AuthRepository _authRepository;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  VibeUser? _currentUser;
  VibeUser? get currentUser => _currentUser;

  signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final user =
        await _authRepository.signInWithEmailAndPassword(email, password);
    VibeUser? vibeUser;
    try {
      _firestore.collection('users').doc(user!.uid).get().then((value) {
        if (value.exists) {
          vibeUser = VibeUser.fromJson(value.data()!);
        }
      });
    } catch (e) {
      rethrow;
    }
    _currentUser = vibeUser;
    return _currentUser;
  }

  Future<VibeUser?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required DateTime dob,
    required String username,
  }) async {
    try {
      final user =
          await _authRepository.signUpWithEmailAndPassword(email, password);

      // Check if user is 13 years or older
      DateTime verifyingDOB =
          DateTime.now().subtract(const Duration(days: 365 * 13));
      if (dob.isAfter(verifyingDOB)) {
        throw Exception('User must be 13 years or older');
      }

      // Check if username is unique
      final usernameCheck = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();
      if (usernameCheck.docs.isNotEmpty) {
        throw Exception('Username is already taken');
      }

      // Create user
      final newUser = VibeUser(
        id: user?.uid ?? '',
        email: email,
        username: username,
        userPreferences: UserPreferences(
            birthday: dob,
            age: DateTime.now().year - dob.year,
            contentPreferences:
                ContentPreferences(downloadPreferences: DownloadPreferences()),
            downloadPreferences: DownloadPreferences(),
            notificationPreferences: NotificationPreferences(),
            playbackPreferences: PlaybackPreferences()),
      );

      await _firestore.collection('users').doc(user!.uid).set(newUser.toJson());
      _currentUser = newUser;
    } catch (e) {
      rethrow;
    }
    return _currentUser;
  }

  void signOut() {
    _authRepository.signOut();
    _currentUser = null;
  }
}
