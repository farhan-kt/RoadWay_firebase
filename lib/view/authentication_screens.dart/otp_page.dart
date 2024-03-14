import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/snackbar_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/view/authentication_screens.dart/widgets/login_widgets.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
      body: SingleChildScrollView(
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
                    if (authProvider.otpFormKey.currentState!.validate()) {
                      try {
                        authProvider.verifyOtp(
                            authProvider.otpController.text, context);
                      } catch (e) {
                        log('error during otp: $e');
                        SnackBarWidget()
                            .showErrorSnackbar(context, 'Invalid OTP');
                      }
                    }
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
