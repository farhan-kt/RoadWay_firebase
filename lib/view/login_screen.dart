// ignore_for_file: must_be_immutable

import 'package:car_sale_firebase/view/register_screen.dart';
import 'package:car_sale_firebase/widget/bottom_screen.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/textformfield_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .07, left: 15, right: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/RoadWay.png'),
              SizedBox(
                height: size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextFormField(
                        labelText: 'Email', controller: emailController),
                    CustomTextFormField(
                      labelText: 'password',
                      controller: passwordController,
                      obscureText: true,
                    ),
                    ButtonWidgets().rectangleButton(size, name: 'LOGIN',
                        onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomScreen()));
                    },
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 3)),
                    textPoppins(name: '-- or Login with --'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textPoppins(name: "Don't have an account? "),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: textAbel(
                        name: 'Register Now',
                        color: Colors.blueAccent[400],
                        fontsize: 17,
                        fontweight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
