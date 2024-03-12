import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/view/authentication_screens.dart/otp_page.dart';
import 'package:car_sale_firebase/view/authentication_screens.dart/widgets/login_widgets.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/snackbar_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    const OutlineInputBorder inputBorderColor = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );
    return Scaffold(
      appBar: AppBar(
          title: textPoppins(
              name: 'Enter Your Phone Number',
              fontsize: 20,
              fontweight: FontWeight.bold)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(left: size.width * .05),
            child: Container(
              height: size.height * .4,
              width: size.width * .8,
              child: Lottie.asset('assets/otp.json', fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: size.height * .07),
          Container(
            height: size.height * .25,
            padding: EdgeInsets.symmetric(horizontal: size.width * .08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Form(
                    key: authProvider.otpFormKey,
                    child: LoginWidgets().phoneTextFormField(context)),
                ButtonWidgets().rectangleButton(size, name: 'GENERATE OTP',
                    onPressed: () {
                  if (authProvider.otpFormKey.currentState!.validate()) {
                    try {
                      authProvider.getOtp(authProvider.phoneController.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpScreen()));
                      authProvider.clearPhoneController();
                      SnackBarWidget().showSuccessSnackbar(
                          context, 'OTP had send successfully');
                    } catch (e) {
                      SnackBarWidget().showErrorSnackbar(
                          context, 'Please enter a valid mobile number');
                    }
                  }
                })
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
