import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isObsecure;
  const AuthField(
      {super.key,
      required this.controller,
      required this.hint,
      this.isObsecure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hint is missing!";
        }
        return null;
      },
      obscureText: isObsecure,
    );
  }
}
