import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Ref ref;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthService(this.ref);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> signIn(String email, String password) async {
    final bool userExists = await _checkUserExists(email);
    try {
      if (!userExists) {
        throw Exception("User not found. Please Register First.");
      }
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveUserState(true);
      return result;
    } on FirebaseAuthException catch (e) {
      throw Exception("Failed to login: ${e.message}");
    }
  }

  Future<UserCredential?> signUp(
    String username,
    String email,
    String password,
  ) async {
    final bool userExists = await _checkUserExists(email);
    try {
      if (userExists) {
        throw Exception("User already exist. Please Login");
      }
      final UserCredential usercreated = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _addUserToDatabase(username, email, password);
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

  Future<void> _addUserToDatabase(
    String username,
    String emailid,
    String password,
  ) async {
    try {
      UserModel user = UserModel(username: username, emailid: emailid);
      await _firestore.collection('users').add(user.toMap());
    } catch (e) {
      throw Exception("Failed to register: $e");
    }
  }

  Future<bool> _checkUserExists(String emailid) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> result = await _firestore
          .collection("users")
          .where('emailid', isEqualTo: emailid)
          .limit(1)
          .get();
      return result.docs.isNotEmpty;
    } catch (e) {
      throw Exception("Error in checking: $e");
    }
  }

  Future<void> _saveUserState(bool isloggedIn) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool("isLoggedIn", isloggedIn);
  }

  Future<bool> getUserState() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('isLoggedIn') ?? false;
  }
}
