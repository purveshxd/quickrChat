import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickrchat/core/authservice.dart';
import 'package:quickrchat/firebase_options.dart';
import 'package:quickrchat/views/authscreens/loginscreen.dart';
import 'package:quickrchat/views/authscreens/registerscreen.dart';

import 'views/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.purple,
          // brightness: Brightness.dark
          // appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
        ),
        routes: {
          '/homepage': (context) => const Homepage(),
        },
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Homepage();
            } else {
              return const RegisterScreen();
            }
          },
        ));
  }
}
