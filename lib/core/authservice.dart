import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickrchat/core/database_service.dart';

class AuthService {
  final FirebaseAuth firebaseInstance = FirebaseAuth.instance;

  Future registerUser(
      String userEmail, String userPassword, String userName) async {
    try {
      await firebaseInstance
          .createUserWithEmailAndPassword(
              email: userEmail, password: userPassword)
          .then((value) {
        var uid = value.user!.uid;
        DatabaseService(uid: uid).addUserData(userEmail, userName);
      });
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future loginUser(String userEmail, String userPassword) async {
    try {
      await firebaseInstance.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
