import 'package:car_sale_firebase/widget/settings_screen_widgets.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: size.height * .08, left: size.width * .05),
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
              buildSettingItem(icon: Icons.person, onTap: () {}, title: '')
            ],
          ),
        ),
      ),
    );
  }
}
