import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProductItem extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onIncreaseQuantity;
  final VoidCallback onDecreaseQuantity;

  CartProductItem({
    required this.product,
    required this.quantity,
    required this.onRemove,
    required this.onIncreaseQuantity,
    required this.onDecreaseQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.title,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.close, color: Colors.grey),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${product.price} ₽',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    '$quantity пациент',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: onDecreaseQuantity,
                    icon: const Icon(Icons.remove),
                    color: Colors.grey,
                    iconSize: 20,
                  ),
                  IconButton(
                    onPressed: onIncreaseQuantity,
                    icon: const Icon(Icons.add),
                    color: Colors.grey,
                    iconSize: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}