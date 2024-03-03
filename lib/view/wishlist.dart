import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              textPoppins(
                name: 'wishlist',
                fontsize: 25,
                fontweight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
