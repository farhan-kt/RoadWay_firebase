import 'package:car_sale_firebase/view/select_login.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 1,
            width: size.width * 1,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/welcome_screen.png'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              top: 100,
              left: 25,
              child: Column(
                children: [
                  textPoppins(
                      name: 'RoadWay',
                      fontsize: 25,
                      fontweight: FontWeight.w600,
                      color: Colors.white),
                  textAbel(
                      name: 'Exotic vintage and premium cars',
                      color: Colors.white,
                      fontsize: 17,
                      fontweight: FontWeight.w600)
                ],
              )),
          Positioned(
              bottom: 50,
              left: 15,
              right: 15,
              child: ButtonWidgets().rectangleButton(size,
                  name: 'Lets Start',
                  bgColor: Colors.white,
                  fgColor: Colors.black, onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectLoginScreen()));
              }))
        ],
      ),
    );
  }
}
