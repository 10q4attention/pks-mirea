import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Молчанов Иван Андреевич';
  String group = 'ЭФБО-01-22';
  String email = '10q4attention@mail.ru';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Профиль",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF424242),
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
              Text(
                name,
                style: const TextStyle(
                  fontSize: 28.0,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                group,
                style: const TextStyle(
                  fontSize: 28.0,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                        currentName: name,
                        currentGroup: group,
                        currentEmail: email,
                        onSave: (updatedName, updatedGroup, updatedEmail) {
                          setState(() {
                            name = updatedName;
                            group = updatedGroup;
                            email = updatedEmail;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
                child: Text('Редактировать профиль',
                style: TextStyle( 
                  color: Color(0xFF424242),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String currentName;
  final String currentGroup;
  final String currentEmail;
  final Function(String, String, String) onSave;

  const EditProfilePage({
    Key? key,
    required this.currentName,
    required this.currentGroup,
    required this.currentEmail,
    required this.onSave,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController groupController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentName);
    groupController = TextEditingController(text: widget.currentGroup);
    emailController = TextEditingController(text: widget.currentEmail);
  }

  @override
  void dispose() {
    nameController.dispose();
    groupController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактировать профиль'),
        backgroundColor: const Color(0xFFF5DEB3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Имя',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: groupController,
              decoration: const InputDecoration(
                labelText: 'Группа',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                widget.onSave(
                  nameController.text,
                  groupController.text,
                  emailController.text,
                );
              },
              child: const Text('Сохранить',
              style: TextStyle( 
                  color: Color(0xFF424242),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
