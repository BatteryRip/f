import 'package:flutter/material.dart';
import 'package:k/productList.dart';
import 'package:k/review.dart';
import 'package:k/users.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({required this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final TextEditingController _commentController = TextEditingController();
  int _rating = 1;

  void _addReview() {
    if (_commentController.text.isNotEmpty && _rating > 0) {
      final newReview = Review(
        username: currentUser ?.username ?? 'Аноним',
        rating: _rating,
        comment: _commentController.text,
      );

      setState(() {
        widget.product.reviews.add(newReview);
      });

      _commentController.clear();
      _rating = 1; // Сбросить оценку
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о товаре'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.product.pictureUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('${widget.product.price.toStringAsFixed(2)} руб.', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text(widget.product.description),
            SizedBox(height: 16),
            Text('Отзывы:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: widget.product.reviews.length,
                itemBuilder: (context, index) {
                  final review = widget.product.reviews[index];
                  return ListTile(
                    title: Text('${review.username} - ${review.rating} ★'),
                    subtitle: Text(review.comment),
                  );
                },
              ),
            ),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Ваш комментарий',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            DropdownButton<int>(
              value: _rating,
              items: List.generate(5, (index) => index + 1)
                  .map((rating) => DropdownMenuItem<int>(
                value: rating,
                child: Text('$rating ★'),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _rating = value!;
                });
              },
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _addReview,
              child: Text('Добавить отзыв'),
            ),
          ],
        ),
      ),
    );
  }
}