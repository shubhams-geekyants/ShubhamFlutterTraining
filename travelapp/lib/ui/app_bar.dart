import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget{
  String title;
  MyAppBar(this.title);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 10),
        Text(title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

}