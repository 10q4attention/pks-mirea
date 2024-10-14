import 'package:flutter/material.dart';
import '../models/device.dart';

class CartPage extends StatelessWidget {
  final List<Device> cartItems; 

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Корзина пуста'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(cartItems[index].title),
                  subtitle: Text('${cartItems[index].price} руб.'),
                );
              },
            ),
    );
  }
}