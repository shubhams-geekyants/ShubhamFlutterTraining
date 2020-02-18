import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:travelapp/service/graphql_config.dart';
import 'package:travelapp/ui/app_bar.dart';

import 'package:travelapp/ui/login.dart';
import 'package:travelapp/ui/main_screen.dart';
import 'package:travelapp/ui/otp.dart';
import 'package:travelapp/ui/signup_form.dart';
import 'package:travelapp/ui/travel_with_us.dart';
import 'package:travelapp/ui/validate_otp.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static GraphQLConfig _config = GraphQLConfig();
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: _config.client,
      child: MaterialApp(
        title: 'Travel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        initialRoute: '/signup-from',
        routes: {
          '/': (context)=>Scaffold(backgroundColor: Colors.white, body: Login()),
          '/login': (context) =>Scaffold(backgroundColor: Colors.white, body: Login()),
          '/otp': (context)=> Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: MyAppBar('Signup'),
              ),
              body: Otp(),
          ),
          '/validate-otp': (context)=> ValidateOtp(),
          '/signup-from': (context)=> Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: MyAppBar('Signup'),
              ),
              body: SignUpForm()
          ),
          '/main_screen': (context) => MainScreen(),
          '/travel_with_us': (context)=> TravelWithUs(),
        },
      ),
    );
  }
}