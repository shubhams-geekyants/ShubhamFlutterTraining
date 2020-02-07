import 'package:flutter/material.dart';

import 'package:travelapp/ui/login.dart';
import 'package:travelapp/ui/main_screen.dart';
import 'package:travelapp/ui/travel_with_us.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Login()
      ),
      routes: {
        '/login': (context) => Login(),
        '/main_screen': (context) => MainScreen(),
        '/travel_with_us': (context)=> TravelWithUs(),
      },
    );
  }
}