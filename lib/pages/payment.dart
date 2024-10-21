import 'package:flutter/material.dart';
import 'package:k/pages/products.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  String _cardNumber = '';
  String _expirationDate = '';
  String _cvv = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оплата'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Номер карты',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите номер карты';
                  }
                  return null;
                },
                onSaved: (value) => _cardNumber = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Дата окончания действия',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите дату окончания действия';
                  }
                  return null;
                },
                onSaved: (value) => _expirationDate = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите CVV';
                  }
                  return null;
                },
                onSaved: (value) => _cvv = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process payment here
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentSuccessPage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text("Оплатить"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Успех!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Оплата прошла успешно!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Products()),
              );},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text("Вернуться к товарам"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}