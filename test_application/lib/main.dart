
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var test = 0;
  List<Choice> choices = const <Choice>[
    const Choice(title: 'Car', icon: Icons.directions_car),
    const Choice(title: 'Bicycle', icon: Icons.directions_bike),
    const Choice(title: 'Boat', icon: Icons.directions_boat),
    const Choice(title: 'Bus', icon: Icons.directions_bus),
    const Choice(title: 'Train', icon: Icons.directions_railway),
    const Choice(title: 'Walk', icon: Icons.directions_walk),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        body: Center(
          child:Text('Hellp World. $test'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.indigo,
          elevation: 5,
          onPressed: ()=>{test++},
        ),
      ),
    );
  }
}