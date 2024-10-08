import 'package:flutter/material.dart';
import '../models/device.dart';
import '../components/device_card.dart';

class FavouritePage extends StatefulWidget {
  final List<Device> favoriteDevices; 
  const FavouritePage({super.key, required this.favoriteDevices});

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFFF5DEB3),
      body: widget.favoriteDevices.isEmpty
          ? const Center(child: Text('Нет избранных товаров'))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemCount: widget.favoriteDevices.length,
              itemBuilder: (BuildContext context, int index) {
                return DeviceCard(
                  device: widget.favoriteDevices[index],
                  onFavoriteToggle: (device) {}, 
                );
              },
            ),
    );
  }
}
