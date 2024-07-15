import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/providers/auth_provider.dart';



class AuthRepository{
  const AuthRepository(this._auth,);

  final FirebaseAuth _auth;
  get currentUser => FirebaseAuth.instance.currentUser;

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<UserCredential?> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }

Future<void> signOut(WidgetRef ref) async {
   await _auth.signOut();
   ref.read(vibeUserProvider.notifier).state = null;
  }

  validateEmailPassword(String email, String password) {
    final alphanumeric = RegExp(r'^[a-zA-Z0-9!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]+$');
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password are required');
    }
    final emailPattern = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if(!email.contains('@')|| !emailPattern.hasMatch(email) ){
      throw Exception('Invalid email');
    }
    if(!alphanumeric.hasMatch(password) || password.length < 6 ){
      throw Exception('Password must be at least 6 characters, and contain only letters, numbers, and special characters\n e.g. @, #, !, etc.');
    }
    return true;
  }
}