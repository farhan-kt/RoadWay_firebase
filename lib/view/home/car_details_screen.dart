import 'package:car_sale_firebase/view/home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatelessWidget {
  final carName;
  final description;
  final catergory;
  final price;
  final image;

  const CarDetailsScreen(
      {super.key,
      this.carName,
      this.description,
      this.catergory,
      this.price,
      this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .07, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            SizedBox(height: size.height * .01),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Card(
                  elevation: 8,
                  child: Container(
                    height: size.height * 0.4,
                    width: size.width * .8,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: image, fit: BoxFit.contain),
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  carDetailsText(
                      value: carName,
                      color: Color(0xFF00246B),
                      fontsize: 32,
                      fontWeight: FontWeight.bold),
                  SizedBox(height: size.height * .01),
                  carDetailsText(
                      value: catergory,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontsize: 16),
                  SizedBox(height: size.height * .02),
                  carDetailsText(
                      value: 'Description', fontWeight: FontWeight.w500),
                  SizedBox(height: size.height * .01),
                  carDetailsText(value: description, color: Colors.black54),
                  SizedBox(height: size.height * .02),
                  Divider(thickness: 1),
                  carDetailsText(
                      value: 'price',
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontsize: 20),
                  SizedBox(height: size.height * .01),
                  carDetailsText(
                      value: '₹ ${price.toString()}',
                      fontWeight: FontWeight.w800,
                      fontsize: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
