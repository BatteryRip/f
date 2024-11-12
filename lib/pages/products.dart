import 'package:flutter/material.dart';
import 'package:k/category.dart';
import 'package:k/pages/categoryFilter.dart';
import 'package:k/pages/payment.dart';
import 'package:k/pages/productDetails.dart';
import 'package:k/pages/profile.dart';
import 'package:k/productList.dart';
import 'package:k/users.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Map<Product, int> cartItems = {};
  List<Product> filteredProducts = products;
  final TextEditingController _searchController = TextEditingController();

  void _addToCart(Product product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
    } else {
      cartItems[product] = 1;
    }
  }

  late List<Category> selectedCategories = [];

  void _filterProducts(String query) {
    filteredProducts = products.where((product) {
      bool matchesQuery = product.name.toLowerCase().contains(query.toLowerCase());
      bool matchesCategory = selectedCategories.isEmpty || product.categories.any((category) => selectedCategories.contains(category));
      return matchesQuery && matchesCategory;
    }).toList();
    setState(() {});
  }

  void _onSelectedCategoriesChanged(List<Category> categories) {
    setState(() {
      selectedCategories = categories;
      _filterProducts(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Товары'),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(currentUser !.avatarUrl),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 32.0,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Поиск товаров...',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                      ),
                      onSubmitted: (value) {
                        _filterProducts(value);
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _filterProducts(_searchController.text);
                  },
                  child: Text('Поиск'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        padding: EdgeInsets.all(10.0),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  filteredProducts[index].pictureUrl,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    filteredProducts[index].name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${filteredProducts[index].price.toStringAsFixed(2)} руб.',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(product: filteredProducts[index]),
                          ),
                        );
                      },
                      child: Text('?'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _addToCart(filteredProducts[index]);
                      },
                      child: Text('+'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryFilter(onSelectedCategoriesChanged: _onSelectedCategoriesChanged,)),
                );
              },
              child: Text('Выбрать категории'),
            ),
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
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
            Text('${(product.price * quantity).toStringAsFixed(2)} руб.'),
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