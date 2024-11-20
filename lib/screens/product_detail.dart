import 'package:flutter/material.dart';
import 'package:pacil_shop_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

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
              product.fields.sections,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Price: IDR ${product.fields.price}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Description:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.fields.description,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                minimumSize: const Size(double.infinity, 48.0),
              ),
              child: const Text('Back to Product List'),
            ),
          ],
        ),
      ),
    );
  }
}