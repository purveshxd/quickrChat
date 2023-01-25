import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickrchat/core/authservice.dart';
import 'package:quickrchat/core/database_service.dart';
import 'package:quickrchat/widgets/user_listtile.dart';

class UserChatView extends StatelessWidget {
  const UserChatView({super.key});

  @override
  Widget build(BuildContext context) {
    var uid = FirebaseAuth.instance.currentUser!.uid;

    return FutureBuilder(
        future: DatabaseService().firebaseUserInstance.get(),
        builder: (context, snapshot) {
          debugPrint(
              "------>${snapshot.data!.docs.elementAt(0).get('friends')[0]}");

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: UserListTile(username: "Hello"),
              ),
            );
          } else if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
