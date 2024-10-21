import 'package:flutter/material.dart';
import 'package:k/pages/products.dart';
import 'package:k/pages/auth.dart';

class Reg extends StatelessWidget {
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
                        controller: TextEditingController(),
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
                        controller: TextEditingController(),
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
                        controller: TextEditingController(),
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
                        controller: TextEditingController(),
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
                  onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Products()),
                  );},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text("Войти"),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: (){Navigator.push(
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