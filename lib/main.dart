import 'package:flutter/material.dart';
import 'package:k/pages/auth.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Магазин',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Auth(),
    );
  }
}