import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:travelapp/model/book.dart';
import 'package:travelapp/service/graphql_config.dart';
import 'package:travelapp/service/graphql_query.dart';

class GraphQLServices {
  final GraphQLConfig _graphQLConfig = GraphQLConfig();
  final GraphQLQuery _graphQLQuery = GraphQLQuery();

  Future<List<Book>> fetchBooks() async{
    List<Book> _books =List<Book>();
    GraphQLClient _client = _graphQLConfig.client;
    QueryResult _result = await _client.query(
        QueryOptions(
            document: _graphQLQuery.books
        )
    );
    if(_result.hasException){
      print(_result.exception);
      throw Exception("Unable to perform request!");
    }else{

      final data = _result.data['books'];
      return data.map((book)=>Book.fromJSON(book)).toList().cast<Book>();
    }
  }
}