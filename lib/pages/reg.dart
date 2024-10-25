import 'package:flutter/material.dart';
import 'package:k/pages/products.dart';
import 'package:k/pages/auth.dart';
import 'package:k/users.dart';

Widget _buildTextField(TextEditingController controller, String hint, String label, {bool obscureText = false}) {
  return Container(
    width: 300,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
      ),
    ),
  );
}

class Reg extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Регистрация', style: TextStyle(
                    fontSize: 25
                )),
                _buildTextField(_usernameController, "Имя", "Логин"),
                SizedBox(height: 8),
                _buildTextField(_emailController, "E-Mail", "Электронная почта"),
                SizedBox(height: 8),
                _buildTextField(TextEditingController(), "Номер телефона", "Телефон"),
                SizedBox(height: 8),
                _buildTextField(_passwordController, "Введите пароль", "Пароль"),
                SizedBox(height: 8),
                _buildTextField(_confirmPasswordController, "Введите пароль", "Пароль"),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    String username = _usernameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String confirmPassword = _confirmPasswordController.text;
                    if (password != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Пароли не совпадают')),
                      );
                      return;
                    }
                    userRepository.createUser (username, email, password, 'https://upload.wikimedia.org/wikipedia/ru/1/1d/%D0%91%D0%B5%D0%B7%D0%BC%D1%8F%D1%82%D0%B5%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C.png');
                    userRepository.authenticate(username, password);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Products()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text("Зарегистрироваться"),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: (){Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Auth()),
                  );},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    child: Text("Авторизироваться"),
                  ),
                ),
              ]
          )
      ),
    );
  }
}