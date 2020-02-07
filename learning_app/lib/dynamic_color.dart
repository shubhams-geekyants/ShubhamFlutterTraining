import 'package:flutter/material.dart';
import 'dart:math';
// ignore: must_be_immutable
class DynamicColor extends StatefulWidget{
  Widget child;
  DynamicColor({this.child});
  @override
  State<StatefulWidget> createState() => _DynamicColorState(child: child);
}

class _DynamicColorState extends State<DynamicColor>{
  Widget child;
  AnimationController _animationController;
  Animation _animation;
  var _random = Random();
  List<Color> _colors = [
    Colors.teal,
    Colors.black,
    Colors.indigo,
    Colors.orange,
    Colors.amber,
    Colors.deepPurpleAccent,
    Colors.cyan,
    Colors.brown,
  ];
  Color _color;
  _DynamicColorState({this.child});

  Color get _randomColor{
    return _colors[_random.nextInt(_colors.length)];
  }
  void _newRandomColor(){
    setState(() {
      _color = _randomColor;
    });
  }
  @override
  void initState() {
    super.initState();
    _color = _randomColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _newRandomColor,
        child: Container(
          decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(5)
          ),
          child: child,
      )
    );
  }

}