import 'package:travelapp/model/book.dart';

class BookViewModel {
  final Book book;
  BookViewModel({this.book});

  String get title {
    return this.book.title;
  }

  String get author {
    return this.book.author;
  }
  
}