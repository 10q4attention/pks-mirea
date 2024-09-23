import 'package:flutter/material.dart';
import '../models/device.dart';

class DevicePage extends StatelessWidget {
  final Device device;

  const DevicePage({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(device.title),
      ),
      backgroundColor: const Color(0xFFF5DEB3), 
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              device.imageUrl,
              height: 350,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: const Color(0xFF424242), 
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, 
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Категория: ${device.category}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      device.description,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white, // белый текст для контраста
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${device.price} ₽',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // белый текст
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'На складе: ${device.quantity}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70, // светло-серый для контраста
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Добавить в корзину',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
