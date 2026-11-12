import 'package:flutter/material.dart';

// EX 3 – The products (handout page: EX 3)
// Part 1: build ONE product card (images are in assets/ex3/).
// Part 2: create the Product enum (follow the UML in the handout).
// Part 3: extract the card into a StatelessWidget called ProductCard.

enum Product {
  dart('Dart', 'A programming language', 'assets/ex3/dart.png'),
  flutter('Flutter', 'A tool to build apps', 'assets/ex3/flutter.png'),
  firebase('Firebase', 'A backend service', 'assets/ex3/firebase.png');

  final String title;
  final String description;
  final String image;

  const Product(this.title, this.description, this.image);
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(product.image, height: 80),
          Text(product.title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(product.description),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProductCard(
                product: Product.dart,
              ),
              ProductCard(
                product: Product.flutter,
              ),
              ProductCard(
                product: Product.firebase,
              )
            ],
          ),
        ), // YOUR CODE
      ),
    ),
  );
}
