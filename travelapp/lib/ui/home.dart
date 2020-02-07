import 'package:flutter/material.dart';

import 'package:travelapp/ui/app_bar.dart';

class Home extends StatelessWidget{
  Widget child;
  Home({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyAppBar('TravelApp'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: child
            ),
          )
        ],
      ),
    );
  }

}