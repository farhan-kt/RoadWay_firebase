import 'package:car_sale_firebase/controller/car_provider.dart';
import 'package:car_sale_firebase/view/home/car_details_screen.dart';
import 'package:car_sale_firebase/widget/home_product_details_container.dart';
import 'package:car_sale_firebase/widget/home_widgets.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPoppins(
                name: 'wishlist',
                fontsize: 25,
                fontweight: FontWeight.w600,
              ),
              Expanded(
                child: Consumer<CarProvider>(
                  builder: (context, carValue, child) {
                    if (carValue.allCarList.isEmpty) {
                      return Center(child: Image.asset('assets/RoadWay.png'));
                    } else {
                      final allCar = carValue.allCarList;
                      return GridView.builder(
                        gridDelegate: gridDelegate(size.width * 0.0018),
                        itemCount: allCar.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CarDetailsScreen(),
                                ),
                              );
                            },
                            child: HomeCarContainer(
                              product: allCar,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
