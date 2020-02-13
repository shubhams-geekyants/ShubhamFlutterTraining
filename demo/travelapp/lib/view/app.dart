import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/view/book_list_vew.dart';
import 'package:travelapp/viewmodel/book_list_vew_model.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies",
      home: ChangeNotifierProvider(
        create: (context) => BookListViewModel(),
        child: BookList(),
      ),
    );
  }
}