import 'package:flutter/material.dart';
import 'package:k/pages/payment.dart';
import 'package:k/pages/profile.dart';

class Products extends StatelessWidget {
  Map<Product, int> cartItems = {};

  void _addToCart(Product product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
    } else {
      cartItems[product] = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Товары'),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/ru/1/1d/%D0%91%D0%B5%D0%B7%D0%BC%D1%8F%D1%82%D0%B5%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C.png'), // Замените на URL вашей картинки
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileEdit()),
              );
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].name),
              subtitle: Text('${products[index].price.toStringAsFixed(2)} руб.'),
              trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        _addToCart(products[index]);
                      },
                      child: Text('+'),
                    )
                  ]
              ),
            );
          }
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductCart(cartItems)),
                );
              },
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
                child: Text("Корзина"),
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  Product(
      {required this.name,
        required this.price,});
}

class ProductCart extends StatefulWidget {
  final Map<Product, int> cartItems;
  ProductCart(this.cartItems);

  @override
  _ProductCartState createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    int totalQuantity = 0;

    widget.cartItems.forEach((product, quantity) {
      totalAmount += product.price * quantity;
      totalQuantity += quantity;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          Product product = widget.cartItems.keys.elementAt(index);
          int quantity = widget.cartItems.values.elementAt(index);
          return ListTile(
            title: Text(product.name),
            subtitle: Row(
              children: [
                Text('Количество: $quantity'),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.remove ),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) {
                        widget.cartItems[product] = quantity - 1;
                      } else {
                        widget.cartItems.remove(product);
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      widget.cartItems[product] = quantity + 1;
                    });
                  },
                ),
              ],
            ),
            trailing:
            Text('\$${(product.price * quantity).toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Итого: ${totalAmount.toStringAsFixed(2)} руб.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
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
    );
  }
}

final List<Product> products = [
  Product(
    name: 'Товар 1',
    price: 200,
  ),
  Product(
    name: 'Товар 2',
    price: 155,
  ),
];