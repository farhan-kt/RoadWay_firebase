// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_sale_firebase/view/select_login.dart';
import 'package:car_sale_firebase/widget/normal_widgets.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:car_sale_firebase/view/settings/about_app.dart';
import 'package:car_sale_firebase/controller/bottombar_provider.dart';
import 'package:car_sale_firebase/view/settings/help_center_page.dart';
import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/view/settings/widgets/settings_screen_widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final bottomProvider = Provider.of<BottomProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * .08,
            left: size.width * .04,
            right: size.width * .04),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPoppins(
                name: 'Settings',
                fontsize: 25,
                fontweight: FontWeight.w600,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: size.height * .35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSettingItem(
                      context,
                      icon: Icons.info_outline,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutApp()));
                      },
                      title: 'About',
                    ),
                    buildSettingItem(
                      context,
                      icon: Icons.headphones_outlined,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HelpCenter()));
                      },
                      title: 'Help and support',
                    ),
                    buildSettingItem(
                      context,
                      icon: Icons.phone,
                      onTap: () {
                        contactSheet(context);
                      },
                      title: 'Contact RoadWay',
                    ),
                    buildSettingItem(
                      context,
                      icon: Icons.exit_to_app_outlined,
                      onTap: () {
                        alertSheet(context,
                            alertMessage: 'ARE YOU SURE TO LOGOUT ?',
                            onPressed: () {
                          authProvider.googleSignOut();
                          authProvider.logOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectLoginScreen(),
                            ),
                            (route) => false,
                          );
                          bottomProvider.currentIndex = 0;
                        }, confirmButtonLabel: 'LOGOUT');
                      },
                      title: 'Log Out',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
