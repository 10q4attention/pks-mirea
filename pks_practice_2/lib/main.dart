import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            secondary: Colors.white, primary: Color.fromRGBO(11, 107, 254, 1)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Авторизация',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 120),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Логин',
                    hintStyle: const TextStyle(
                        fontSize: 17.0,
                        color: Color.fromRGBO(146, 145, 150, 1)),
                    filled: true,
                    fillColor: const Color.fromRGBO(240, 239, 244, 1),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Пароль',
                    hintStyle: const TextStyle(
                        fontSize: 17.0,
                        color: Color.fromRGBO(146, 145, 150, 1)),
                    filled: true,
                    fillColor: const Color.fromRGBO(240, 239, 244, 1),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                        fillColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.selected)) {
                              return const Color.fromRGBO(11, 107, 254, 1);
                            }
                            return const Color.fromRGBO(240, 239, 244, 1);
                          },
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: const BorderSide(
                          width: 1.0,
                          color: Color.fromRGBO(146, 145, 150, 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    const Text(
                      'Запомнить меня',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(146, 145, 150, 1)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 36),
                    backgroundColor: const Color.fromRGBO(11, 107, 254, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Text(
                      "Войти",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    side: const BorderSide(
                      color: Color.fromRGBO(11, 107, 254, 1),
                      width: 1.0,
                    ),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Text(
                      "Регистрация",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Восстановить пароль',
                    style: TextStyle(
                        fontSize: 17, color: Color.fromRGBO(146, 145, 150, 1)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}