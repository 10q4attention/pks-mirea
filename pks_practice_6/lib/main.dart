import 'models/device.dart';
import 'package:flutter/material.dart';
import 'pages/main_page.dart';
import 'pages/favorite_page.dart';
import 'pages/profile_page.dart';
import 'pages/cart_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  List<Device> favoriteDevices = [];
  List<Device> cartItems = []; 

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      MainPage(onFavoriteToggle: _toggleFavorite, onAddToCart: _addToCart), 
      FavouritePage(favoriteDevices: favoriteDevices),
      CartPage(cartItems: cartItems),
      const ProfilePage(),
    ]);
  }

  void _toggleFavorite(Device device) {
    setState(() {
      if (favoriteDevices.contains(device)) {
        favoriteDevices.remove(device); 
      } else {
        favoriteDevices.add(device); 
      }
    });
  }

  void _addToCart(Device device) {
    setState(() {
      cartItems.add(device); 
    });
  }

  void onItemTapped(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        selectedItemColor: const Color(0xFFF5DEB3),
        unselectedItemColor: const Color(0xFF424242),
      ),
    );
  }
}