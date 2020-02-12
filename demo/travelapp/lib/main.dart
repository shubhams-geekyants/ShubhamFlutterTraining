import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:travelapp/service/graphql_config.dart';
import 'package:travelapp/service/graphql_query.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  GraphQLConfig _graphQLConfig = GraphQLConfig();
  GraphQLQuery _graphQLQuery = GraphQLQuery();

  List _bookList = [];

  void _onRefresh() async {
    GraphQLClient _client = _graphQLConfig.client;
    QueryResult _result = await _client.query(
        QueryOptions(
            document: _graphQLQuery.booksName
        )
    );
    if(_result.hasException){
      // Code to handle the exception
      print('Error');
    }else{
      setState((){
        _bookList = _result.data['books'];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: new AppBar(title: new Text("Flutter GraphQL")),
        body: ListView.builder(
            itemCount: _bookList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Container(
                padding: EdgeInsets.only(top: 30, left: 20),
                child: Text('Book: ${_bookList[index]['title']}'),
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onRefresh,
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}