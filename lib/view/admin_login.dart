import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/textformfield_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    const OutlineInputBorder inputBorderColor = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: size.height * .5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        textPoppins(
                          name: 'RoadWay',
                          fontsize: 25,
                          fontweight: FontWeight.w600,
                        ),
                        textAbel(
                            name: 'M  O  T  O  R  S',
                            fontsize: 17,
                            fontweight: FontWeight.w800),
                      ],
                    ),
                    CustomTextFormField(
                        labelText: 'Admin Key',
                        controller: adminProvider.adminController,
                        enabledBorder: inputBorderColor,
                        focusedBorder: inputBorderColor,
                        focusErrorBorder: inputBorderColor),
                    CustomTextFormField(
                      labelText: 'Password',
                      controller: adminProvider.adminPassController,
                      obscureText: true,
                      enabledBorder: inputBorderColor,
                      focusedBorder: inputBorderColor,
                      focusErrorBorder: inputBorderColor,
                    ),
                    ButtonWidgets().rectangleButton(
                      size,
                      name: 'Submit',
                      onPressed: () {
                        adminProvider.adminLogin(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
