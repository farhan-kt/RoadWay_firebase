// ignore_for_file: must_be_immutable

import 'package:car_sale_firebase/widget/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/textformfield_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .07, left: 15, right: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded)),
              textPoppins(
                name: 'RoadWay Register',
                fontsize: 25,
                fontweight: FontWeight.w600,
              ),
              textAbel(
                  name: 'Ready to race your engine',
                  fontsize: 17,
                  fontweight: FontWeight.w800),
              SizedBox(height: size.height * .1),
              SizedBox(
                height: size.height * .5,
                child: Form(
                  key: authProvider.RegisterFormkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextFormField(
                          labelText: 'Email',
                          controller: authProvider.emailController),
                      CustomTextFormField(
                        labelText: 'Password',
                        controller: authProvider.passwordController,
                        obscureText: true,
                      ),
                      CustomTextFormField(
                        labelText: 'Confirm password',
                        controller: authProvider.confirmPasswordController,
                        obscureText: true,
                      ),
                      ButtonWidgets().rectangleButton(
                        size,
                        name: 'Register',
                        onPressed: () {
                          if (authProvider.RegisterFormkey.currentState!
                              .validate()) {
                            try {
                              if (authProvider.passwordController.text ==
                                  authProvider.confirmPasswordController.text) {
                                authProvider.registerUser(
                                    authProvider.emailController.text,
                                    authProvider.passwordController.text);

                                Navigator.pop(context);
                                authProvider.clearControllers();
                                SnackBarWidget().showSuccessSnackbar(
                                    context, 'Registeration success');
                              } else {}
                            } catch (e) {
                              SnackBarWidget().showSuccessSnackbar(
                                  context, 'Registeration failed');
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textPoppins(name: "Already have an account? "),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: textAbel(
                        name: 'Login Now',
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
