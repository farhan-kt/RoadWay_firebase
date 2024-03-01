import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool? obscureText;
  final TextEditingController controller;
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Value is empty';
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        fillColor: Colors.grey[200],
        filled: true,
        border: InputBorder.none,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
