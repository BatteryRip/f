class Category {
  final List<String> categoryType;
  final String name;

  Category({required this.categoryType, required this.name});
}

final List<String> categoryType = [
  'Цвет', 'Тип', 'Сезон'
];

final List<Category> categories = [
  Category(categoryType: [categoryType[0]], name: 'Синий'),
  Category(categoryType: [categoryType[0]], name: 'Красный'),
  Category(categoryType: [categoryType[0]], name: 'Зелёный'),
  Category(categoryType: [categoryType[0]], name: 'Жёлтый'),
  Category(categoryType: [categoryType[1]], name: 'Верх'),
  Category(categoryType: [categoryType[1]], name: 'Низ'),
  Category(categoryType: [categoryType[2]], name: 'Лето'),
  Category(categoryType: [categoryType[2]], name: 'Зима'),
  Category(categoryType: [categoryType[2]], name: 'Весна/Осень')
];