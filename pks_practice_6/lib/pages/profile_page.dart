import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Профиль",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w400,
              color:  const Color(0xFF424242),
            ),
          ),
        ),
        backgroundColor: const Color(0xFFF5DEB3),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFFF5DEB3),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                width: 200,
                height: 200,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://avatars.githubusercontent.com/u/120212263?v=4',
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFF5DEB3),
                    width: 3,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Молчанов Иван Андреевич',
                style: TextStyle(
                  fontSize: 28.0,
                  color: const Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'ЭФБО-01-22',
                style: TextStyle(
                  fontSize: 28.0,
                  color: const Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                '10q4attention@mail.ru',
                style: TextStyle(
                  fontSize: 20.0,
                  color:const Color(0xFF424242),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
