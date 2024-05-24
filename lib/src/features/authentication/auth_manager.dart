import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibe_podcasting/constants/domain/storage_path.dart';
import 'package:vibe_podcasting/src/features/database/database_manager.dart';

import '../../../constants/models/user_preferences.dart';
import '../../../constants/models/vibe_user.dart';
import '../../repository/auth_repo.dart';

class AuthManager {
  AuthManager(
    this._authRepository,
    this._databaseManager,
  );

  final AuthRepository _authRepository;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseManager _databaseManager;
  VibeUser? _currentUser;
  VibeUser? get currentUser => _currentUser;
  int ageCheck = 0;

  Future<VibeUser?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    User? user;
    VibeUser? vibeUser;
    try {
      _authRepository.validateEmailPassword(email, password);
      user = await _authRepository.signInWithEmailAndPassword(email, password);
      if(user == null) {
        throw Exception('User not found');
      }
      await _firestore.collection('users').doc(user.uid).get().then((value) {
        if (value.exists) {
          vibeUser = VibeUser.fromJson(value.data()!);
        }
        _currentUser = vibeUser;
      });
    } catch (e) {
      rethrow;
    }
    return _currentUser;
  }

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
    String confirmPassword,
  ) async {
    UserCredential? userCredential;
    try {
      if (password != confirmPassword) {
        throw Exception('Passwords do not match');
      }
      _authRepository.validateEmailPassword(email, password);
      await _authRepository
          .signUpWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        if (value != null) {
          userCredential = value;
        }
      });
      return userCredential?.user;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<VibeUser?> createVibeUserFile(
    User? user, {
    required bool over13,
    required XFile? photoUri,
    required String username,
  }) async {
    if (!over13) {
      if (ageCheck == 0) {
        ageCheck++;
        throw Exception('Must be over the age of 13 to join.');
      } else if (ageCheck == 2) {
        // make the account as a TOO YOUNG Account and give access after aging
        throw Exception('Must be over the age of 13 to join.');
      }
    }

    final profilePicture = photoUri != null ? await _databaseManager.addToDatabase(
        photoUri, StoragePath.images, user?.uid ?? 'temp') : '';
    final UserPreferences userPreferences = UserPreferences(
      profilePicture: profilePicture,
      username: username,
    );

    final VibeUser vibeUser = VibeUser(
      email: user?.email ?? '',
      id: user?.uid ?? '',
      userPreferences: userPreferences,
    );
    await _firestore.collection('Users').doc(user?.uid).set(vibeUser.toJson());
    return vibeUser;
  }

  void signOut(WidgetRef ref) {
    _authRepository.signOut(ref);
    _currentUser = null;
    deleteUser();
  }

  loadUser() async {
    if(_authRepository.currentUser != null) {
      await _firestore.collection('Users').doc(_authRepository.currentUser.uid).get().then((value) {
        if (value.exists) {
          return VibeUser.fromJson(value.data() ?? {});
        }
      });
    }
  }

void deleteUser() {
    final prefs = SharedPreferences.getInstance();
    prefs.then((value) {
      value.remove('user');
    });
  }
}
