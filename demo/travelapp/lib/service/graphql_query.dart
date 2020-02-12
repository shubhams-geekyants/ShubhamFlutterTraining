/// File graphql_query.dart in Service folder
class GraphQLQuery{
  String get booksName{
    return '''
      query{
        books{
          title
        }
      }
    ''';
  }
  String get books {
    return '''
      query{
        books{
          name
          title
        }
      }
    ''';
  }
}