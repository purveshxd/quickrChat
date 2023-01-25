// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  final String username;
  const UserListTile({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // tileColor: Colors.grey.shade100,
      leading: const CircleAvatar(),
      title: Text(username.toString()),
      subtitle: const Text("Last/Recent Message"),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert_rounded),
        onPressed: () {
          // TODO: Add Auth service
          // TODO: Add FireBase Storage to the App
          // TODO: Fix QrScanner
        },
      ),
    );
  }
}
