import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pks_practice_3/services/product_service.dart';
import '../models/device.dart';
import '../components/device_card.dart';
import '../pages/add_device_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {
  List<Device> devices = [];

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    try {
      devices = await ProductService.getProducts();
      setState(() {});
    } on DioException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Товары',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFFF5DEB3),
      body: devices.isEmpty
          ? const Center(child: SizedBox()) 
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6, 
                mainAxisSpacing: 8.0, 
                crossAxisSpacing: 8.0, 
              ),
              itemCount: devices.length,
              itemBuilder: (BuildContext context, int index) {
                return DeviceCard(
                  device: devices[index],
                  onFavoriteToggle: (device) {},
                  onAddToCart: (device) {}, 
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDevicePage(onAddDevice: (device) {}),
            ),
          );
        },
        backgroundColor: Colors.black,
        foregroundColor: const Color(0xFFF5DEB3),
        child: const Icon(Icons.add),
      ),
    );
  }
}