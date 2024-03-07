// ignore_for_file: must_be_immutable

import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/view/authentication_screens.dart/register_screen.dart';
import 'package:car_sale_firebase/widget/bottom_screen.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/snackbar_widget.dart';
import 'package:car_sale_firebase/widget/textformfield_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              Image.asset('assets/RoadWay.png'),
              SizedBox(
                height: size.height * 0.5,
                child: Form(
                  key: authProvider.loginFormkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextFormField(
                          labelText: 'Email',
                          controller: authProvider.emailController),
                      CustomTextFormField(
                        labelText: 'password',
                        controller: authProvider.passwordController,
                        obscureText: true,
                      ),
                      ButtonWidgets().rectangleButton(size, name: 'LOGIN',
                          onPressed: () async {
                        if (authProvider.loginFormkey.currentState!
                            .validate()) {
                          try {
                            await authProvider.loginUser(
                                authProvider.emailController.text,
                                authProvider.passwordController.text);
                            SnackBarWidget().showSuccessSnackbar(
                                context, 'login successfull');
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomScreen()),
                                (route) => false);
                            authProvider.clearControllers();
                          } catch (e) {
                            SnackBarWidget()
                                .showErrorSnackbar(context, 'failed to login');
                          }
                        }
                      },
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 3)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          children: [
                            Flexible(child: Divider(thickness: 1.5)),
                            textPoppins(name: '  or Login with  '),
                            Flexible(child: Divider(thickness: 1.5))
                          ],
                        ),
                      ),
                    ],
                  ),
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
