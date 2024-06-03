import 'package:flutter/material.dart';
import 'package:testapplication/feature/Home/home.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.imageUrl,
                height: 250,
              ),
            ),
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.price,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
