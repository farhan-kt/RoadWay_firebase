import 'package:car_sale_firebase/view/admin/admin_login.dart';
import 'package:car_sale_firebase/view/authentication_screens.dart/login_screen.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class SelectLoginScreen extends StatelessWidget {
  const SelectLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:
            textPoppins(name: 'Select Your Login', fontweight: FontWeight.bold),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * .07, horizontal: size.width * .1),
          child: SizedBox(
            height: size.height * .55,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Image.asset('assets/RoadWay.png'),
                  SizedBox(height: size.height * .05),
                  ButtonWidgets().selectLogin(size, onPressed: () {
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
                          name: 'User Login',
                          color: Colors.white,
                          fontsize: 20)),
                  SizedBox(height: size.height * .05),
                  ButtonWidgets().selectLogin(
                    size,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminLoginScreen(),
                          ));
                    },
                    icon: Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Colors.white,
                    ),
                    label: textPoppins(
                        name: 'Admin Login', color: Colors.white, fontsize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
