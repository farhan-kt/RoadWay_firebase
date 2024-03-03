import 'package:car_sale_firebase/widget/home_widgets.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00246B),
        toolbarHeight: 170,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textPoppins(
                name: 'Find Your Perfect',
                color: Color(0xFFCADCFC),
                fontsize: 25,
                fontweight: FontWeight.w700),
            Row(
              children: [
                textPoppins(
                    name: 'Used Car',
                    color: Color(0xFFCADCFC),
                    fontsize: 25,
                    fontweight: FontWeight.w700),
                SizedBox(width: 12),
                Icon(
                  Icons.directions_car,
                  color: Color(0xFFCADCFC),
                )
              ],
            ),
            SizedBox(height: 10),
            searchTextFormField()
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Your other content here
          ],
        ),
      ),
    );
  }
}
