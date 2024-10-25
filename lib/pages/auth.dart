import 'package:flutter/material.dart';
import 'package:k/pages/products.dart';
import 'package:k/pages/reg.dart';
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

class Auth extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Авторизация', style: TextStyle(
                    fontSize: 25
                )),
                _buildTextField(_usernameController, "Имя / E-Mail / Телефон", "Логин"),
                SizedBox(height: 8),
                _buildTextField(_passwordController, "Введите пароль", "Пароль"),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    User? user = userRepository.authenticate(username, password);
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Products()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Неверный логин или пароль')),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text("Войти"),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: (){Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Reg()),
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
                    child: Text("Зарегистрироваться"),
                  ),
                ),
              ]
          )
      ),
    );
  }
}