import 'package:flutter/material.dart';

class HomeCarContainer extends StatelessWidget {
  const HomeCarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: size.width * 0.3,
              width: size.width * 0.3,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.contain,
              //     image: NetworkImage(
              //       // product.image.toString(),
              //     )
              //   ),
              // ),
            ),
          ),
          Text(
            'Unknown',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            'Unknown',
            style: TextStyle(
              // color: product.category == 'men' ? Colors.blue : Colors.pink,
              fontSize: 12,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // '₹ ${product.price.toString()}',
                'ff',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
