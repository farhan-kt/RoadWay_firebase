import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/view/select_login.dart';
import 'package:car_sale_firebase/widget/normal_widgets.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Widget searchTextFormField({controller, onChanged}) {
  return TextFormField(
    onChanged: onChanged,
    controller: controller,
    style: const TextStyle(color: Colors.white),
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
        style: GoogleFonts.poppins(
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

Widget adminHomeAppBarLogOutBtn(context) {
  final authProvider =
      Provider.of<AuthenticationProvider>(context, listen: false);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      textPoppins(
          name: 'Find Your Perfect',
          color: const Color(0xFFCADCFC),
          fontsize: 25,
          fontweight: FontWeight.w700),
      IconButton(
          onPressed: () {
            alertSheet(context, alertMessage: 'ARE YOU SURE TO LOGOUT ?',
                onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectLoginScreen(),
                ),
                (route) => false,
              );
              authProvider.isAdminHome = false;
            }, confirmButtonLabel: 'LOGOUT');
          },
          icon: const Icon(
            Icons.exit_to_app_rounded,
            color: Color(0xFFCADCFC),
          ))
    ],
  );
}
