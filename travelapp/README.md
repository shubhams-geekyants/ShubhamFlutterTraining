# Travelapp


### Getting Started Flutter with GraphQL
**So, what is GraphQL and why we need integration of GraphQL with Flutter?<br>**
In simple words Flutter is UI toolkit which manages the UI rendering, state etc... 
but what if we want to share data among multiple users. So here we have lot of 
solutions like REST APIs, GraphQL API etc... and in these solution generally 
we have centralized system where we keep data and on the basis of access 
permissions users can access, modify that data.<br>
So today we are going to use **GraphQL** for building APIs for understating how
to integrate GraphQL API with Flutter application<br>

####GraphQL Backend Setup 
So before getting started we have to setup a GraphQL server and I 
use  [Apollo Server](https://www.apollographql.com/docs/apollo-server/) as 
framework.<br>
**Step 1:** Init NodeJs project
```
mkdir travelapp_server
cd  travelapp_server
npm init --yes
npm install apollo-server graphql
```
**Step 2:** Create **index.js** file
```
touch index.js
```
**Step 3:** Define your GraphQL schema
Every GraphQL server (including Apollo Server) uses a schema to define the 
structure of data that clients can query. Define GraphQL schema in **index.js** file
```javascript
const { ApolloServer, gql } = require('apollo-server');

const typeDefs = gql`
  type Book {
    title: String
    author: String
  }
  type Query {
    books: [Book]
  }
`;
```
**Step 4:** Define mock data in **index.js** to return
```javascript
const books = [
  {
    title: 'Harry Potter and the Chamber of Secrets',
    author: 'J.K. Rowling',
  },
  {
    title: 'Jurassic Park',
    author: 'Michael Crichton',
  },
];
```
**Step 5:** Define a resolver
We've defined our data set, but Apollo Server doesn't know that it should use 
that data set when it's executing a query. To fix this, we create a resolver.
```javascript
const resolvers = {
  Query: {
    books: () => books,
  },
};
```
**Step 6:** Create an instance of ApolloServer
We've defined our schema, data set, and resolver. Now we just need to provide 
this information to Apollo Server when we initialize it.
```javascript
const server = new ApolloServer({ typeDefs, resolvers });
server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});
```
####Flutter Setup
First, depends on the library by adding this to your packages **pubspec.yaml**:
**Step 1:** Installation
```
dependencies:
  graphql_flutter: ^2.0.0
```
**Step 2:** Create a Service and Config GraphQL
```dart
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
```

**Step 3:** Create file for building query
```dart
/// File graphql_query.dart in Service folder
class GraphQLQuery{
  String get booksName{
    return '''
      query{
        books{
          name
        }
      }
    ''';
  }
  String get books {
    return '''
      query{
        books{
          name
          author
        }
      }
    ''';
  }
}
``` 
**Step 4:** Use this service in UI
Import query and config file in UI file
```dart
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:travelapp/service/graphql_config.dart';
import 'package:travelapp/service/graphql_query.dart';

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  GraphQLConfig _graphQLConfig = GraphQLConfig();
  GraphQLQuery _graphQLQuery = GraphQLQuery();
  
  List<Map<String, String>> _bookList;

  @override
  void initState(){
    _bookList = List<Map<String, String>>[];
    super.initState();
  }
  
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
      if(_result.hasData){
        setState((){
          _bookList = _result.data['booksName'];
        });
      }
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
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Text('Book: ${_bookList[index]['name']}'),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onRefresh,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
```
#Thank You :relieved:

