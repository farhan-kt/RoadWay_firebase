import 'package:car_sale_firebase/widget/home_widgets.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                elevation: 5,
                child: Container(
                  height: size.height * 0.23,
                  width: size.width * double.infinity,
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     image: DecorationImage(image: image, fit: BoxFit.cover),
                  //     color: Colors.grey[500]),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.06),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                carDetailsText(value: 'sas'),
                const SizedBox(height: 20),
                carDetailsText(value: 'dsd'),
                const SizedBox(height: 20),
                carDetailsText(value: 'dsds'),
                const SizedBox(height: 20),
                carDetailsText(value: 'dsds'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
