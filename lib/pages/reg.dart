import 'package:flutter/material.dart';
import 'package:k/pages/products.dart';
import 'package:k/pages/auth.dart';
import 'package:k/users.dart';

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
                Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:BorderRadius.circular(20),
                    ),
                    child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                            hintText: "Имя",
                            labelText: "Логин",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0)
                        )
                    )
                ),
                SizedBox(height: 8),
                Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:BorderRadius.circular(20),
                    ),
                    child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "E-Mail",
                            labelText: "Электронная почта",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0)
                        )
                    )
                ),
                SizedBox(height: 8),
                Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:BorderRadius.circular(20),
                    ),
                    child: TextField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                            hintText: "Номер телефона",
                            labelText: "Телефон",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0)
                        )
                    )
                ),
                SizedBox(height: 8),
                Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:BorderRadius.circular(20),
                    ),
                    child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Введите пароль",
                            labelText: "Пароль",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0)
                        )
                    )
                ),
                SizedBox(height: 8),
                Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:BorderRadius.circular(20),
                    ),
                    child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Введите пароль",
                            labelText: "Пароль",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0)
                        )
                    )
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    String username = _usernameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String confirmPassword = _confirmPasswordController.text;

                    // Проверка на совпадение паролей
                    if (password != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Пароли не совпадают')),
                      );
                      return; // Прерываем выполнение, если пароли не совпадают
                    }

                    // Создание нового пользователя с уникальным ID
                    userRepository.createUser (username, email, password, 'https://upload.wikimedia.org/wikipedia/ru/1/1d/%D0%91%D0%B5%D0%B7%D0%BC%D1%8F%D1%82%D0%B5%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C.png'); // URL по умолчанию

                    // Переход на страницу товаров после успешной регистрации
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