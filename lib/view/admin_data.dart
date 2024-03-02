import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class AdminAddDataScreen extends StatelessWidget {
  const AdminAddDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            CircleAvatar(
              backgroundImage: AssetImage('assets/RoadWay.png'),
            ),
            Row(
              children: [
                ButtonWidgets().rectangleButton(size,
                    name: 'Camera',
                    onPressed: () {},
                    bgColor: Colors.black,
                    fgColor: Colors.white)
              ],
            )
          ],
        ),
      ),
    );
  }
}
