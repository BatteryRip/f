import 'package:flutter/material.dart';
import 'package:k/category.dart';

class CategoryFilter extends StatefulWidget {
  final Function(List<Category>) onSelectedCategoriesChanged;

  CategoryFilter({required this.onSelectedCategoriesChanged});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryFilter> {
  List<Category> selectedCategories = [];

  void _toggleCategorySelection(Category category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
  }

  void _applyFilters() {
    widget.onSelectedCategoriesChanged(selectedCategories);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выбор категорий'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _applyFilters,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index].name),
            subtitle: Text(categories[index].categoryType.first),
            trailing: Checkbox(
              value: selectedCategories.contains(categories[index]),
              onChanged: (bool? value) {
                _toggleCategorySelection(categories[index]);
              },
            ),
          );
        },
      ),
    );
  }
}