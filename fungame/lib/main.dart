import 'package:flutter/material.dart';
import 'package:fungame/match.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
          appBar:AppBar(title: Text('Try your luck')),
          body: Match(),
      ),
    );
  }
}
