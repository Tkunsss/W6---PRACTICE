import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum Product {
  dart(
    title: 'Dart',
    description: 'the best object language',
    image: 'assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'the best mobile widget library',
    image: 'assets/ex3/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'the best cloud database',
    image: 'assets/ex3/firebase.png',
  );

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: Container(
          color: Colors.blue,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: Product.values
                .map((product) => ProductCard(product: product))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image),
            Text(product.title),
            Text(product.description, style: const TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
