import 'package:car_sale_firebase/view/home/home.dart';
import 'package:car_sale_firebase/widget/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/textformfield_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              adminProvider.clearAdminController();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: size.height * .5,
                child: Form(
                  key: adminProvider.adminFormkey,
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
                        focusErrorBorder: inputBorderColor,
                        validateMsg: 'Admin Key is Empty',
                      ),
                      Consumer<AuthenticationProvider>(
                        builder: (context, value, child) => CustomTextFormField(
                          labelText: 'Password',
                          controller: value.adminPassController,
                          obscureText: value.obscureText,
                          enabledBorder: inputBorderColor,
                          focusedBorder: inputBorderColor,
                          focusErrorBorder: inputBorderColor,
                          validateMsg: 'Enter Admin Password',
                          suffixIcon: IconButton(
                            icon: Icon(value.obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                            onPressed: () {
                              value.obscureChange();
                            },
                          ),
                        ),
                      ),
                      ButtonWidgets().rectangleButton(
                        size,
                        name: 'Submit',
                        onPressed: () {
                          if (adminProvider.adminFormkey.currentState!
                              .validate()) {
                            adminLogin(context);
                            adminProvider.isAdminHome = true;
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void adminLogin(context) {
    final adminProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    if (adminProvider.adminController.text == 'farhan' &&
        adminProvider.adminPassController.text == '123') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      adminProvider.adminController.clear();
      adminProvider.adminPassController.clear();
    } else {
      SnackBarWidget()
          .showErrorSnackbar(context, 'Admin Key or Password Incorrect');
    }
  }
}
