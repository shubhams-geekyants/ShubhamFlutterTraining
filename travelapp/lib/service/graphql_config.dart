import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:travelapp/storage/token.dart';

class GraphQLConfig{
  static HttpLink _link = HttpLink(
    uri:'http://localhost:4000/'
  );
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    ),
  );

  GraphQLClient clientToQuery({String token}) {
    if(token != null){
      AuthLink authLink = AuthLink(
        getToken: () async => Token.token,
      );
      final Link link  = authLink.concat(_link);
      return GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      );
    }
    return GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );
  }

}