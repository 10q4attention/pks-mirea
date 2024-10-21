import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Эдуард',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '+7 900 800-55-33',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'email@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            _buildProfileOption(
              iconPath: 'lib/assets/icons/1.png',
              text: 'Мои заказы',
            ),
            _buildProfileOption(
              iconPath: 'lib/assets/icons/2.png',
              text: 'Медицинские карты',
            ),
            _buildProfileOption(
              iconPath: 'lib/assets/icons/3.png',
              text: 'Мои адреса',
            ),
            _buildProfileOption(
              iconPath: 'lib/assets/icons/4.png',
              text: 'Настройки',
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Ответы на вопросы',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Политика конфиденциальности',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Пользовательское соглашение',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Выход',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({required String iconPath, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 28,
            height: 28,
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}