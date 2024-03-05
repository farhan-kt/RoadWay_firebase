import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

Widget carDetailsText({String? value, double? fontsize, fontWeight, color}) {
  return Row(
    children: [
      Text(
        value!,
        style: GoogleFonts.abel(
            fontSize: fontsize,
            fontWeight: fontWeight,
            color: color ?? Colors.black,
            letterSpacing: 1),
      ),
    ],
  );
}

SliverGridDelegateWithFixedCrossAxisCount gridDelegate(childAspectRatio) {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: childAspectRatio,
  );
}
