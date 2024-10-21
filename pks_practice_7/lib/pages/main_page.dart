import 'package:flutter/material.dart';
import '../models/product.dart';
import '../components/product_card.dart';

class MainPage extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onAddToCart;

  MainPage({required this.products, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Каталог услуг',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            onAddToCart: () => onAddToCart(products[index]),
          );
        },
      ),
    );
  }
}