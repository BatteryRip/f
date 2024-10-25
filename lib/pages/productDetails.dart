import 'package:flutter/material.dart';
import 'package:k/productList.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о товаре'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('${product.price.toStringAsFixed(2)} руб.', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}