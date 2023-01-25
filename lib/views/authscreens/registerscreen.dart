import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quickrchat/constants/constants.dart';
import 'package:quickrchat/core/authservice.dart';
import 'package:quickrchat/views/authscreens/loginscreen.dart';
import 'package:quickrchat/widgets/custom_button.dart';
import 'package:quickrchat/widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    await AuthService()
        .registerUser(emailController.text, passwordController.text,
            usernameController.text)
        .whenComplete(() {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Icon(
                Icons.qr_code_scanner_rounded,
                color: Colors.purple.shade700,
                size: 200,
              ),
              const Text(
                "Welcome to quickrChat, just scan the quickrCode and start chatting",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: usernameController,
                hintText: 'Enter Username',
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'Enter Email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Enter Password',
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                buttonLabel: "Sign Up",
                onPressed: () => registerUser(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member ?'),
                  TextButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          )),
                      child: const Text(
                        'Login here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
