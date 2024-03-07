import 'package:car_sale_firebase/view/admin/admin_login.dart';
import 'package:car_sale_firebase/view/authentication_screens.dart/login_screen.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class SelectLoginScreen extends StatelessWidget {
  const SelectLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            textPoppins(name: 'Select Your Login', fontweight: FontWeight.bold),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                label: textPoppins(
                    name: 'User Login', color: Colors.white, fontsize: 20),
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 35)),
                    shape: MaterialStatePropertyAll(BeveledRectangleBorder()))),
            const SizedBox(height: 20),
            OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminLoginScreen(),
                      ));
                },
                icon: const Icon(
                  Icons.person_outline,
                  size: 30,
                  color: Colors.white,
                ),
                label: textPoppins(
                    name: 'Admin Login', color: Colors.white, fontsize: 20),
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
                    shape: MaterialStatePropertyAll(BeveledRectangleBorder()))),
          ],
        ),
      ),
    );
  }
}
