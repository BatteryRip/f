import 'package:k/category.dart';
import 'package:k/review.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String pictureUrl;
  final List<Category> categories;
  final List<Review> reviews;
  Product(
      {required this.name,
        required this.description,
        required this.price,
        required this.pictureUrl,
        required this.categories,
        this.reviews = const [],});
}

final List<Product> products = [
  Product(
      name: 'Футблока 1',
      description: 'пример описанияя',
      price: 3000,
      pictureUrl: 'https://media.istockphoto.com/id/1354031012/ru/%D1%84%D0%BE%D1%82%D0%BE/%D0%BA%D1%80%D0%B0%D1%81%D0%BD%D1%8B%D0%B9-%D0%BC%D0%B0%D0%BA%D0%B5%D1%82-%D1%84%D1%83%D1%82%D0%B1%D0%BE%D0%BB%D0%BA%D0%B8-%D0%BC%D1%83%D0%B6%D1%87%D0%B8%D0%BD%D1%8B-%D0%B2-%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5-%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD%D0%B0-%D0%B4%D0%B8%D0%B7%D0%B0%D0%B9%D0%BD%D0%B0-%D1%84%D1%83%D1%82%D0%B1%D0%BE%D0%BB%D0%BA%D0%B0-%D1%81-%D0%B7%D0%B0%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B8%D0%B7%D0%BE%D0%BB%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B0-%D0%BD%D0%B0.jpg?s=2048x2048&w=is&k=20&c=qrRNniSfZhDhS6tECN8ndLxcffQj26Dl925Xe_M2hI8=',
      categories: [categories[1], categories[4]],
      reviews: [
        Review(username: 'Пользователь1', rating: 5, comment: 'Комментарий'),
        Review(username: 'Пользователь2', rating: 4, comment: '12345'),
      ],
  ),
  Product(
      name: 'Товар 2',
      description: 'пример описания',
      price: 4000,
      pictureUrl: 'https://media.istockphoto.com/id/465485415/ru/%D1%84%D0%BE%D1%82%D0%BE/%D0%B3%D0%BE%D0%BB%D1%83%D0%B1%D0%B0%D1%8F-%D1%84%D1%83%D1%82%D0%B1%D0%BE%D0%BB%D0%BA%D0%B0-%D0%BE%D0%B1%D1%82%D1%80%D0%B0%D0%B2%D0%BA%D0%B0.jpg?s=2048x2048&w=is&k=20&c=O4hKUcz92Xj59NRx_VEAszvFNZ31kG2xt2Uf_9SyOtI=',
      categories: [categories[0], categories[4]],
      reviews: [],
  ),
  Product(
      name: 'Низ',
      description: 'пример',
      price: 5000,
      pictureUrl: 'https://media.istockphoto.com/id/173239968/ru/%D1%84%D0%BE%D1%82%D0%BE/%D0%BE%D0%B1%D0%BB%D0%B5%D0%B3%D0%B0%D1%8E%D1%89%D0%B8%D0%B5-%D1%81%D0%B8%D0%BD%D0%B8%D0%B5-%D0%B4%D0%B6%D0%B8%D0%BD%D1%81%D1%8B-%D0%BD%D0%B0-%D0%B1%D0%B5%D0%BB%D0%BE%D0%BC-%D1%84%D0%BE%D0%BD%D0%B5.jpg?s=2048x2048&w=is&k=20&c=_K4vUxkRDuz3Aed8ZGWYGEB4eLs4C56eHo_P6Go_G9Y=',
      categories: [categories[0], categories[5]],
      reviews: [],
  ),
];