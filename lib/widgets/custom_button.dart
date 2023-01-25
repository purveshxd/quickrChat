// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  final String buttonLabel;
  final void Function() onPressed;
  const CustomButton({
    Key? key,
    required this.buttonLabel,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      elevation: 0,
      color: Colors.purple.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: onPressed,
      child: Text(
        buttonLabel,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
