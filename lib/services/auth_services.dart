import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Ref ref;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthService(this.ref);

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveUserState(true);
      return result;
    } catch (e) {
      throw Exception("Failed to login: $e");
    }
  }

  Future<UserCredential?> singUp(String email, String password) async {
    try {
      final UserCredential usercreated = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _saveUserState(true);
      return usercreated;
    } catch (e) {
      throw Exception("failed to sign up : $e");
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _saveUserState(false);
    } catch (e) {
      throw Exception("failed to SignOut: $e");
    }
  }

  Future<void> _saveUserState(bool isloggedIn) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool("isLoggedIn", isloggedIn);
  }

  Future<bool> _getUserState() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('isloggedIn') ?? false;
  }
}
