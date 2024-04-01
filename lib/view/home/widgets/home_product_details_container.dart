import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/model/car_model.dart';
import 'package:car_sale_firebase/widget/normal_widgets.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:car_sale_firebase/controller/car_provider.dart';
import 'package:provider/provider.dart';

class HomeCarContainer extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final CarModel product;
  final CarProvider value;

  const HomeCarContainer({
    super.key,
    required this.value,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final carProvider = Provider.of<CarProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.image!),
                ),
              ),
            ),
            SizedBox(height: size.height * .01),
            textPoppins(
                name: product.carName,
                fontweight: FontWeight.bold,
                fontsize: 16),
            SizedBox(height: size.height * .01),
            textPoppins(
                name: '${product.km} Kms',
                fontweight: FontWeight.w500,
                fontsize: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹ ${product.price.toString()} ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                authProvider.isAdminHome
                    ? IconButton(
                        onPressed: () {
                          alertSheet(context, onPressed: () {
                            carProvider.deleteCar(product.id!);
                            Navigator.pop(context);
                          },
                              alertMessage: 'Are You Sure To Delete The Car',
                              confirmButtonLabel: 'DELETE');
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                    : IconButton(
                        onPressed: () {
                          final wish = value.wishListCheck(product);
                          value.wishlistClicked(product.id!, wish);
                        },
                        icon: value.wishListCheck(product)
                            ? const Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
