import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/viewmodel/book_list_vew_model.dart';

import 'books_view.dart';

class BookList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BookListState();
}

class _BookListState extends State<BookList>{
  List _bookList = List();


  @override
  void initState(){
//    Provider.of<BookListViewModel>(context).fetchBooks();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BookListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text("Movies")
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Expanded(
                  child: Books(books: vm.books))
            ])
        ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          onPressed: (){
            vm.fetchBooks();
            print(vm.books);
          },
          icon: Icon(Icons.refresh),
        ),
      ),
    );
  }

}