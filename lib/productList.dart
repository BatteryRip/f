class Product {
  final String name;
  final String description;
  final double price;
  Product(
      {required this.name,
        required this.description,
        required this.price,});
}

final List<Product> products = [
  Product(
    name: 'Товар 1',
    description: 'BUT THEN I HAD A VERY GOOD IDEA - I USED F5!!!',
    price: 200,
  ),
  Product(
    name: 'Товар 2',
    description: 'я вообще кто',
    price: 155,
  ),
];