import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/models/user_preferences.dart';
import '../../../constants/models/vibe_user.dart';
import '../../repository/auth.dart';

class AuthManager {
  AuthManager(
    this._authRepository,
  );

  final AuthRepository _authRepository;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  VibeUser? _currentUser;
  VibeUser? get currentUser => _currentUser;

  signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    User? user;
    VibeUser? vibeUser;
    try {
      _authRepository.validateEmailPassword(email, password);
      user = await _authRepository.signInWithEmailAndPassword(email, password);
      _firestore.collection('users').doc(user!.uid).get().then((value) {
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
    User user, {
    required DateTime birthday,
    required String photoUri,
  }) async {
    int age;

    if (birthday.compareTo(DateTime.now()) > 0) {
      throw Exception('Birthday cannot be in the future');
    }
    if (birthday.compareTo(
            DateTime.now().subtract(const Duration(days: 365 * 13))) >
        0) {
      throw Exception('Must be older than 13 years to use this app');
    } else {
      age = DateTime.now().year - birthday.year;
      age = birthday.month > DateTime.now().month ? age - 1 : age;
    }

    final UserPreferences userPreferences = UserPreferences(
      birthday: birthday,
      age: age,
      profilePicture: photoUri,
    );

    final VibeUser vibeUser = VibeUser(
      email: user.email!,
      id: user.uid,
      userPreferences: userPreferences,
    );
    await _firestore.collection('users').doc(user.uid).set(vibeUser.toJson());
    return vibeUser;
  }

  void signOut(WidgetRef ref) {
    _authRepository.signOut(ref);
    _currentUser = null;
  }
}
