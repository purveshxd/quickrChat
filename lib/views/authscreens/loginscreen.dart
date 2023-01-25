import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quickrchat/constants/constants.dart';
import 'package:quickrchat/core/authservice.dart';
import 'package:quickrchat/views/authscreens/registerscreen.dart';
import 'package:quickrchat/views/homepage.dart';
import 'package:quickrchat/widgets/custom_button.dart';
import 'package:quickrchat/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void loginUser() async {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
      await AuthService()
          .loginUser(emailController.text, passwordController.text)
          .whenComplete(() {
        Navigator.pop(context);
        Navigator.popAndPushNamed(context, '/homepage');
      });
    }

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
                "Welcome back to quickrChat",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                buttonLabel: "Login",
                onPressed: loginUser,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?'),
                  TextButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          )),
                      child: const Text(
                        'SignUp here',
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
