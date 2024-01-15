import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final String labelText;
  final bool obscureText;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.labelText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: Theme.of(context).textTheme.labelLarge,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge,
          ),
          keyboardType: TextInputType.emailAddress,
        ));
  }
}
