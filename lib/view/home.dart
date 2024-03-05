import 'package:car_sale_firebase/controller/car_provider.dart';
import 'package:car_sale_firebase/view/car_details_screen.dart';
import 'package:car_sale_firebase/widget/home_product_details_container.dart';
import 'package:car_sale_firebase/widget/home_widgets.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00246B),
        toolbarHeight: 170,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textPoppins(
                name: 'Find Your Perfect',
                color: const Color(0xFFCADCFC),
                fontsize: 25,
                fontweight: FontWeight.w700),
            Row(
              children: [
                textPoppins(
                    name: 'Used Car',
                    color: const Color(0xFFCADCFC),
                    fontsize: 25,
                    fontweight: FontWeight.w700),
                const SizedBox(width: 12),
                const Icon(
                  Icons.directions_car,
                  color: Color(0xFFCADCFC),
                )
              ],
            ),
            const SizedBox(height: 10),
            searchTextFormField()
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Consumer<CarProvider>(
              builder: (context, carValue, child) {
                if (carValue.searchedList.isEmpty &&
                    carValue.searchController.text.isNotEmpty) {
                  return Center(child: Image.asset('assets/RoadWay.png'));
                } else if (carValue.searchedList.isEmpty) {
                  if (carValue.allCarList.isNotEmpty) {
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
                                builder: (context) => const CarDetailsScreen(),
                              ),
                            );
                          },
                          child: const HomeCarContainer(),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: textAbel(
                          name: 'NO CAR ADDED',
                          fontsize: 20,
                          fontweight: FontWeight.w700),
                    );
                  }
                } else {
                  return GridView.builder(
                    gridDelegate: gridDelegate(size.width * 0.0018),
                    itemCount: carValue.searchedList.length,
                    itemBuilder: (context, index) {
                      final car = carValue.searchedList[index];

                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CarDetailsScreen(),
                              ),
                            );
                          },
                          child: const HomeCarContainer());
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
