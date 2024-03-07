import 'package:car_sale_firebase/view/authentication_screens.dart/login_screen.dart';
import 'package:car_sale_firebase/view/settings/about_app.dart';
import 'package:car_sale_firebase/view/settings/help_center_page.dart';
import 'package:car_sale_firebase/widget/settings_screen_widgets.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                height: size.height * .3,
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
                      icon: Icons.exit_to_app_outlined,
                      onTap: () {
                        sheet(context);
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

  sheet(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              textPoppins(name: 'LOG OUT', fontweight: FontWeight.w600),
              const Text(
                "CONFIRM TO LOG OUT",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 3, 45, 79)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: textPoppins(name: 'CANCEL', color: Colors.white)),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 3, 45, 79))),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: textPoppins(name: 'LOGOUT', color: Colors.white)),
          ],
        );
      },
    );
  }
}
