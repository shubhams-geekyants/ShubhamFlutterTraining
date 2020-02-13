import 'package:flutter/material.dart';
import 'package:travelapp/viewmodel/book_view_model.dart';

class Books extends StatelessWidget{

  final List<BookViewModel> books;

  Books({this.books});

  @override
  Widget build(BuildContext context) {
    print(books);
    return ListView.builder(
      itemCount: this.books.length,
      itemBuilder: (context, index) {
        final book = this.books[index];
        return ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Text(book.title),
          subtitle: Text(book.author),
        );
      },
    );
  }
}