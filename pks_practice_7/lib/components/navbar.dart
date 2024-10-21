import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  Navbar({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(0, 'lib/assets/icons/home1.svg', 'lib/assets/icons/home2.svg'),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(1, 'lib/assets/icons/cart1.svg', 'lib/assets/icons/cart2.svg'),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(2, 'lib/assets/icons/profile1.svg', 'lib/assets/icons/profile2.svg'),
            label: 'Профиль',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromRGBO(26, 111, 238, 1),
        unselectedItemColor: Colors.grey,
        onTap: onTap,
      ),
    );
  }

  Widget _buildIcon(int index, String activeIconPath, String inactiveIconPath) {
    if (selectedIndex == index) {
      return SvgPicture.asset(
        activeIconPath,
        width: 24,
        height: 24,
      );
    } else {
      return SvgPicture.asset(
        inactiveIconPath,
        width: 24,
        height: 24,
      );
    }
  }
}