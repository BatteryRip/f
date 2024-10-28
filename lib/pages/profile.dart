import 'package:flutter/material.dart';
import 'package:k/pages/auth.dart';
import 'package:k/users.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _avatarUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (currentUser  != null) {
      _usernameController.text = currentUser !.username;
      _emailController.text = currentUser !.email;
      _avatarUrlController.text = currentUser !.avatarUrl;
    }
  }

  void _updateProfile() {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String avatarUrl = _avatarUrlController.text;

    if (currentUser  != null) {
      currentUser !.username = username;
      currentUser !.email = email;
      if (password.isNotEmpty) {
        currentUser !.password = password;
      }
      currentUser !.avatarUrl = avatarUrl;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Профиль обновлен')),
      );
    }
  }

  void _logout() {
    currentUser  = null;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Auth()), (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Редактирование профиля'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Логин', style: TextStyle(fontSize: 18)),
            TextField(
              controller: _usernameController,
            ),
            SizedBox(height: 20),
            Text('E-Mail', style: TextStyle(fontSize: 18)),
            TextField(
              controller: _emailController,
            ),
            SizedBox(height: 20),
            Text('Пароль', style: TextStyle(fontSize: 18)),
            TextField(
              controller: _passwordController,
              obscureText: true,
            ),
            SizedBox(height: 20),
            Text('URL аватара', style: TextStyle(fontSize: 18)),
            TextField(
              controller: _avatarUrlController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateProfile();
              },
              child: Text('Сохранить изменения'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _logout();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('Выйти из профиля'),
            ),
          ],
        ),
      ),
    );
  }
}