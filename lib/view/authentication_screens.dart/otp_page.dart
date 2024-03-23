import 'dart:developer';
import 'package:car_sale_firebase/widget/bottom_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/view/authentication_screens.dart/widgets/login_widgets.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  OtpScreen({super.key, required this.verificationId});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: textPoppins(
            name: 'Verify OTP', fontsize: 20, fontweight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: size.height * .5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/mobile otp verify.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                height: size.height * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginWidgets().otpTextFormField(
                      context,
                    ),
                    ButtonWidgets().rectangleButton(size, name: 'V E R I F Y',
                        onPressed: () {
                      // if (formkey.currentState!.validate()) {
                      //   try {
                      //     authProvider.verifyOtp(
                      //         authProvider.otpController.text, context);
                      //     // Navigator.pushAndRemoveUntil(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //         builder: (context) => BottomScreen()),
                      //     //     (route) => false);
                      //   } catch (e) {
                      //     log('error during otp: $e');
                      //     SnackBarWidget()
                      //         .showErrorSnackbar(context, 'Invalid OTP');
                      //   }
                      // } else {
                      //   log('aaaaaa');
                      // }

                      if (authProvider.otpController.text.isNotEmpty) {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode: authProvider.otpController.text
                                      .toString());
                          FirebaseAuth.instance
                              .signInWithCredential(credential)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomScreen()));
                          });
                        } catch (ex) {
                          log(ex.toString());
                        }
                      } else {
                        log('otp is empty');
                      }
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
