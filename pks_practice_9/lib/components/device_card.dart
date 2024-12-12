import 'package:flutter/material.dart';
import '../models/device.dart';
import '../pages/device_page.dart';

class DeviceCard extends StatefulWidget {
  final Device device;
  final Function(Device) onFavoriteToggle;
  final Function(Device) onAddToCart;

  const DeviceCard({
    super.key,
    required this.device,
    required this.onFavoriteToggle,
    required this.onAddToCart,
  });

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onFavoriteToggle(widget.device);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DevicePage(device: widget.device),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.device.imageUrl,
                height: 150, 
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                widget.device.title,
                style: const TextStyle(fontSize: 14), 
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), 
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.device.price} руб.',
                    style: const TextStyle(fontSize: 14), 
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 20, 
                    ),
                    onPressed: _toggleFavorite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), 
              child: ElevatedButton(
                onPressed: () => widget.onAddToCart(widget.device), 
                child: const Text('Добавить в корзину', style: TextStyle(fontSize: 14)), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}