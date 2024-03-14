import 'package:car_sale_firebase/view/settings/widgets/settings_screen_widgets.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: EdgeInsets.only(top: size.height * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: size.width * .16,
                  ),
                  textPoppins(
                      name: 'RoadWay',
                      color: const Color(0xFF00246B),
                      fontsize: 25,
                      fontweight: FontWeight.bold),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.directions_car,
                    color: Color(0xFF00246B),
                  )
                ],
              ),
              settingsTextPoppins(name: 'Description'),
              const SizedBox(height: 10.0),
              settingsTextAbel(
                  name:
                      'RoadWay is a mobile application designed to provide users with a convenient platform for purchasing used cars. With a user-friendly interface and a wide selection of used cars, users can easily browse, search, and add cars to their wishlist and contact RoadWay.'),
              const SizedBox(height: 20.0),
              settingsTextPoppins(name: 'Key Features'),
              const SizedBox(height: 10.0),
              buildKeyFeature(
                  title: 'Browse and Search',
                  description:
                      'Users can browse through a vast collection of cars categorized by make, model, or year. They can also search for specific cars using keywords. '),
              buildKeyFeature(
                  title: 'Car Details',
                  description:
                      'Each car listing includes detailed information such as car name, car type, description, price, and cover image. Users can view these details to make informed purchasing decisions. '),
              buildKeyFeature(
                  title: 'Wishlist',
                  description:
                      ' Users can add cars to their wishlist. compare and review the cars before making a decision on which cars to purchase.'),
            ],
          ),
        ),
      ),
    );
  }
}
