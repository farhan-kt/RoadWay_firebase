import 'package:flutter/material.dart';

Widget searchTextFormField({onChanged, controller}) {
  return TextFormField(
    onChanged: onChanged,
    controller: controller,
    decoration: InputDecoration(
      hintText: 'Search...',
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFCADCFC)),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFCADCFC)),
        borderRadius: BorderRadius.circular(30),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      suffixIcon: const Icon(
        Icons.search,
        color: Colors.white,
      ),
    ),
  );
}
