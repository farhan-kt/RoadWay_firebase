import 'package:car_sale_firebase/view/register_screen.dart';
import 'package:car_sale_firebase/widget/bottom_screen.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .07, left: 15, right: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: size.height * .2,
              ),
              SizedBox(
                height: size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    ButtonWidgets().rectangleButton(size,
                        name: 'LOGIN',
                        bgColor: Colors.black,
                        fgColor: Colors.white, onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomScreen()));
                    }),
                    textPoppins(name: '-- or Login with --'),
                  ],
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
