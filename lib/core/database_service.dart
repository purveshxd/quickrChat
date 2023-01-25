// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickrchat/datamodel/data_model.dart';

class DatabaseService {
  String? uid;
  DatabaseService({
    this.uid,
  });

  final firebaseUserInstance = FirebaseFirestore.instance.collection('users');

  void addUserData(String email, String username) {
    firebaseUserInstance.doc(uid).set({
      "friends": [],
      "userdata": {
        'userEmail': email,
        'userId': uid,
        'userName': username,
      }
    }); 
  }

  Future<Userdata> getUserData(String uid) async {
    var userDoc = await firebaseUserInstance.doc(uid).get();
    Userdata userdata = UserModel.fromJson(userDoc.data()!).userdata;
    return userdata;
  }

  String get username {
    var userDoc = firebaseUserInstance.doc(uid);
    return userModelFromJson(userDoc.toString()).userdata.userName;
  }

// get friends list
  Future<List> getFriends() async {
    var userDoc = await firebaseUserInstance.doc(uid).get();
    List friends = UserModel.fromJson(userDoc.data()!).friends;
    return friends;
  }
}
