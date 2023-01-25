import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickrchat/core/authservice.dart';

import 'package:quickrchat/views/profile_page.dart';
import 'package:quickrchat/views/scanner_screen.dart';
import 'package:quickrchat/views/userchatview.dart';
import 'package:quickrchat/views/welcome_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool cameraView = true;
  void viewCamera() {
    setState(() {
      cameraView = !cameraView;
    });
  }

  void navBarScreen(value) {
    setState(() {
      currentIndex = value;
    });
  }

  int currentIndex = 0;
  final screens = [const UserChatView(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'quickrChat ${AuthService().firebaseInstance.currentUser!.email}'),
        centerTitle: true,
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        enableFeedback: true,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const QRViewExample()));
        },
        child: const Icon(Icons.qr_code_scanner_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentIndex,
        onDestinationSelected: (value) {
          navBarScreen(value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
