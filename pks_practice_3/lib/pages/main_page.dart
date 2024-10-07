import 'package:flutter/material.dart';
import '../models/device.dart';
import '../components/device_card.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<Device> devices = [
    Device(1, 'Ручной пылесос с разными насадками', 10, 'Пылесосы', 'Пылесос Dyson V8',
        55000, 'https://img.mvideo.ru/Pdb/20088199b.jpg'),
    Device(2, 'Прекрасный робот-пылесос', 1, 'Пылесосы', 'Xiaomi Robot Vacuum S12 EU',
        40000, 'https://img.mvideo.ru/Big/400160566bb.jpg'),
    Device(3, 'Ручной пылесос с разными насадками', 14, 'Пылесосы', 'Samsung VS15A6031R4',
        56000, 'https://img.mvideo.ru/Big/20082737bb.jpg'),
    Device(4, 'Прекрасный робот-пылесос', 12, 'Пылесосы', 'Dreame Trouver S10',
        70000, 'https://img.mvideo.ru/Big/400342322bb.jpg'),
    Device(5, 'Ручной пылесос с разными насадками', 15, 'Пылесосы', 'Haier HVC400HE',
        10000, 'https://img.mvideo.ru/Big/400077580bb1.jpg'),
    Device(6, 'Стильный и вместительный холодильник', 6, 'Холодильники', 'Gorenje NRK6202AXL4',
        32000, 'https://img.mvideo.ru/Big/20072561bb.jpg'),
    Device(7, 'Стильный и вместительный холодильник', 3, 'Холодильники', 'Холодильник Candy CCRN 6180S ',
        78000, 'https://img.mvideo.ru/Big/20070161bb.jpg'),
    Device(8, 'Стильный и вместительный холодильник', 19, 'Холодильники', 'Холодильник Hisense RS840N4AIF',
        98000, 'https://img.mvideo.ru/Pdb/400161108b.jpg'),
    Device(9, 'Стильный и вместительный холодильник', 11, 'Холодильники', 'Холодильник Hotpoint HT 9201I W O3',
        123000, 'https://img.mvideo.ru/Big/400258219bb.jpg'),
    Device(10, 'Стильный и вместительный холодильник', 1, 'Холодильники', 'Холодильник Gorenje NRK6202AC4',
        555000, 'https://img.mvideo.ru/Big/20072562bb.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Товары'),
      ),
      backgroundColor: const Color(0xFFF5DEB3),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (BuildContext context, int index) {
          return DeviceCard(device: devices[index]);
        },
      ),
    );
  }
}
