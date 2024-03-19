import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_sale_firebase/controller/car_provider.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:car_sale_firebase/view/home/car_details_screen.dart';
import 'package:car_sale_firebase/view/home/widgets/home_widgets.dart';
import 'package:car_sale_firebase/view/home/widgets/home_product_details_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    Provider.of<CarProvider>(context, listen: false).getAllCar();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            searchTextFormField(
                onChanged: (value) =>
                    carProvider.search(carProvider.searchController.text),
                controller: carProvider.searchController),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CarProvider>(
                builder: (context, carValue, child) {
                  if (carValue.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (carValue.searchList.isEmpty &&
                      carValue.searchController.text.isNotEmpty) {
                    return Center(
                        child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Lottie.asset('assets/no available cars.json'),
                            textPoppins(name: 'SEARCHED CAR IS NOT AVAILABLE')
                          ],
                        ),
                      ),
                    ));
                  } else if (carValue.searchList.isEmpty) {
                    if (carValue.allCarList.isNotEmpty) {
                      final allCar = carValue.allCarList;
                      return GridView.builder(
                        gridDelegate: gridDelegate(size.width * 0.0018),
                        itemCount: allCar.length,
                        itemBuilder: (context, index) {
                          final cars = allCar[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CarDetailsScreen(
                                    carName: cars.carName,
                                    description: cars.description,
                                    catergory: cars.km,
                                    price: cars.price,
                                    image: NetworkImage(cars.image.toString()),
                                  ),
                                ),
                              );
                            },
                            child: HomeCarContainer(
                              value: carProvider,
                              product: cars,
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: textAbel(
                            name: 'NO CARS ADDED',
                            fontsize: 20,
                            fontweight: FontWeight.w700),
                      );
                    }
                  } else {
                    return GridView.builder(
                      gridDelegate: gridDelegate(size.width * 0.0018),
                      itemCount: carValue.searchList.length,
                      itemBuilder: (context, index) {
                        final car = carValue.searchList[index];

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
                              value: carProvider,
                              product: car,
                            ));
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
