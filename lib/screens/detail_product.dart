import 'package:biyung/models/product_entry.dart';
import 'package:flutter/material.dart';

class DetailProductPage extends StatelessWidget {
  final ProductEntry product;

  const DetailProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.product,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text('Name: ${product.fields.name}'),
            const SizedBox(height: 10),
            Text('Price: ${product.fields.price}'),
            const SizedBox(height: 10),
            Text('Description: ${product.fields.description}'),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to List'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}