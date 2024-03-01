import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidgets {
  Widget rectangleButton(Size size,
      {required String name,
      required VoidCallback? onPressed,
      required Color bgColor,
      required Color fgColor}) {
    return SizedBox(
      height: size.height * .08,
      width: size.width * double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(BeveledRectangleBorder()),
          backgroundColor: MaterialStateProperty.all(bgColor),
          foregroundColor: MaterialStateProperty.all(fgColor),
        ),
        onPressed: onPressed,
        child: Text(name,
            style: GoogleFonts.abel(
              fontSize: size.width * .05,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
