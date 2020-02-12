/// File graphql_config.dart in Service folder

import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig{

  static HttpLink _link = HttpLink(
      uri:'http://localhost:4000/'
  );

  GraphQLClient get client {
    return GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );
  }

}