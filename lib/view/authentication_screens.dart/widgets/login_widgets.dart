import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/widget/bottom_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWidgets {
  Widget loginIcons(context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * .0344,
          width: size.width * .073,
          child: InkWell(
            onTap: () async {
              await authProvider.googleSignIn();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => BottomScreen()),
                  (route) => false);
            },
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://cdn.iconscout.com/icon/free/png-256/free-google-1772223-1507807.png')),
          ),
        ),
        SizedBox(width: size.width * .06),
        SizedBox(
          height: size.height * .0344,
          width: size.width * .073,
          child: InkWell(
            onTap: () async {
              authProvider.gitHubSignIn();
            },
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/25/25231.png')),
          ),
        ),
        SizedBox(width: size.width * .06),
        SizedBox(
          height: size.height * .0344,
          width: size.width * .073,
          child: InkWell(
            onTap: () {},
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://cdn-icons-png.freepik.com/256/100/100313.png')),
          ),
        ),
      ],
    );
  }
}
