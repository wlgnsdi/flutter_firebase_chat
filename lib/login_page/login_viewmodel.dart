import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_viewmodel.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@riverpod
class LoginViewmodel extends _$LoginViewmodel {
  final _auth = FirebaseAuth.instance;
  User? user;

  @override
  User? build() {
    return null;
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } catch (e) {
      debugPrint(e.toString());
      user = null;
    }

    state = user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    user = null;
    state = user;
  }
}
