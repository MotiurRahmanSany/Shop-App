import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String image;
  final double price;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      color: const Color.fromRGBO(216, 240, 253, 1),
      child: Column(
        children: [
          Text(title),
          const SizedBox(height: 5),
          Text('\$$price'),
          const SizedBox(height: 5),
          Image.asset(
            image,
            height: 175,
          ),
        ],
      ),
    );
  }
}
