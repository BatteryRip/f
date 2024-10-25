class Product {
  final String name;
  final String description;
  final double price;
  final String pictureUrl;
  Product(
      {required this.name,
        required this.description,
        required this.price,
        required this.pictureUrl,});
}

final List<Product> products = [
  Product(
    name: 'Товар 1',
    description: 'BUT THEN I HAD A VERY GOOD IDEA - I USED F5!!!',
    price: 200,
    pictureUrl: 'https://upload.wikimedia.org/wikipedia/ru/thumb/1/1d/%D0%91%D0%B5%D0%B7%D0%BC%D1%8F%D1%82%D0%B5%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C.png/640px-%D0%91%D0%B5%D0%B7%D0%BC%D1%8F%D1%82%D0%B5%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C.png'
  ),
  Product(
    name: 'Товар 2',
    description: 'я вообще кто',
    price: 155,
    pictureUrl: 'https://nklk.ru/dll_image/1028.png'
  ),
];