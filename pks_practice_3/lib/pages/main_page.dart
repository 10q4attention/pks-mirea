import 'package:flutter/material.dart';
import '../models/device.dart';
import '../components/device_card.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<Device> devices = [
    Device(1, 'Очень хороший телефон', 10, 'Телефоны', 'IPHONE 15 PRO MAX 1TB',
        1000, 'https://img.mvideo.ru/Big/30074465bb.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Товары'),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (BuildContext context, int index) {
          return DeviceCard(device: devices[index]);
        },
      ),
    );
  }
}
