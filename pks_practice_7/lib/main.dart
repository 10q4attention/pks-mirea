import 'package:flutter/material.dart';
import 'models/product.dart';
import 'components/product_card.dart';
import 'components/cart_product_cart.dart';
import 'components/navbar.dart';
import 'pages/profile_page.dart';
import 'pages/cart_page.dart';
import 'pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Product> products = [
    Product(
      title: 'ПЦР-тест на определение РНК коронавируса стандартный',
      description: '2 дня',
      price: 1800,
      deliveryTime: '2 дня',
    ),
    Product(
      title: 'Клинический анализ крови с лейкоцитарной формулировкой',
      description: '1 день',
      price: 690,
      deliveryTime: '1 день',
    ),
    Product(
      title: 'Биохимический анализ крови, базовый',
      description: '1 день',
      price: 2440,
      deliveryTime: '1 день',
    ),
  ];

  final List<Product> cartItems = [];
  final Map<Product, int> itemCounts = {};

  void _addToCart(Product product) {
    setState(() {
      if (itemCounts.containsKey(product)) {
        itemCounts[product] = itemCounts[product]! + 1;
      } else {
        cartItems.add(product);
        itemCounts[product] = 1;
      }
    });
  }

  void _removeFromCart(Product product) {
    setState(() {
      cartItems.remove(product);
      itemCounts.remove(product);
    });
  }

  void _increaseQuantity(Product product) {
    setState(() {
      itemCounts[product] = itemCounts[product]! + 1;
    });
  }

  void _decreaseQuantity(Product product) {
    setState(() {
      if (itemCounts[product]! > 1) {
        itemCounts[product] = itemCounts[product]! - 1;
      } else {
        _removeFromCart(product);
      }
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      MainPage(
        products: products,
        onAddToCart: _addToCart,
      ),
      CartPage(
        cartItems: cartItems,
        itemCounts: itemCounts,
        onCheckout: () {},
        removeFromCart: _removeFromCart,
        onIncreaseQuantity: _increaseQuantity,
        onDecreaseQuantity: _decreaseQuantity,
      ),
      ProfilePage(),
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Navbar(
          selectedIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}