import 'package:flutter/material.dart';
import 'package:travelapp/service/fetch.dart';
import 'package:travelapp/viewmodel/book_view_model.dart';

class BookListViewModel extends ChangeNotifier{
  List<BookViewModel> books = List<BookViewModel>();

  Future<void> fetchBooks() async{
    final result = await GraphQLServices().fetchBooks();
    print('here');
    this.books = result.map((book)=>BookViewModel(book: book)).toList().cast<BookViewModel>();
    print(this.books);
    notifyListeners();
  }

}