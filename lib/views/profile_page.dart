import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quickrchat/core/authservice.dart';
import 'package:quickrchat/core/database_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var uid = AuthService().firebaseInstance.currentUser!.uid;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 55,
              child: Text(DatabaseService(uid: uid).username),
            ),
            Text(FirebaseAuth.instance.currentUser!.email.toString()),
            IconButton(
              color: Colors.purple,
              icon: const Icon(Icons.logout_rounded),
              onPressed: () {
                AuthService().firebaseInstance.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
