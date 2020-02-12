import 'dart:math';

import 'package:flutter/material.dart';

class Match extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Match();
}

class _Match extends State<Match>{
  bool isAccepted = false;
  Map<String, dynamic> _selected;
  int _score = 0;
  final _random = Random();
  final List<Map<String, dynamic>> _gameList=[
    {
      'color':Colors.teal,
      'data': 'teal',
    },
    {
      'color':Colors.deepOrangeAccent,
      'data': 'orange',
    },
    {
      'color':Colors.blue,
      'data': 'blue',
    },
    {
      'color':Colors.amber,
      'data': 'amber',
    },
    {
      'color':Colors.indigo,
      'data': 'indigo',
    },
    {
      'color':Colors.lightGreen,
      'data': 'green',
    },
    {
      'color':Colors.pink,
      'data': 'pink',
    },
    {
      'color':Colors.red,
      'data': 'red',
    },
    {
      'color': Colors.brown,
      'data': 'brown',
    },
  ];

  void _onAccept(String data){
    setState(() {
      _selected = _gameList[_random.nextInt(_gameList.length)];
    });

  }

  void _onReject(String data){
    setState(() {
      _selected = _gameList[_random.nextInt(_gameList.length)];
    });
  }

  @override
  void initState() {
    _gameList.shuffle();
    _selected = _gameList[_random.nextInt(_gameList.length)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: Center(
                  child: GridView.count(
                      primary: false,
                      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                      crossAxisCount: 3,
                      childAspectRatio: 1/1,
                      children: <Widget>[
                        Container(
                          color: _gameList[0]['color'],
                          child: DragTarget(
                            builder:
                            (context, List<String> candidateData, rejectedData){
                              return Container();
                            },
                            onWillAccept: (String data){
                              if(data == _gameList[0]['data']){
                                return true;
                              }
                              return false;
                            },
                            onAccept: _onAccept,
                            onLeave: _onReject,
                          ),
                        ),
                        Container(
                          color: _gameList[1]['color'],
                          child: DragTarget(
                            builder:
                                (context, List<String> candidateData, rejectedData){
                              return Container();
                            },
                            onWillAccept: (String data){
                              if(data == _gameList[1]['data']){
                                return true;
                              }
                              return false;
                            },
                            onAccept: _onAccept,
                            onLeave: _onReject,
                          ),
                        ),
                        Container(
                          color: _gameList[2]['color'],
                          child: DragTarget(
                            builder:
                                (context, List<String> candidateData, rejectedData){
                              return Container();
                            },
                            onWillAccept: (String data){
                              if(data == _gameList[2]['data']){
                                return true;
                              }
                              return false;
                            },
                            onAccept: _onAccept,
                            onLeave: _onReject,
                          ),
                        ),
                        Container(
                          color: _gameList[3]['color'],
                          child: DragTarget(
                            builder:
                                (context, List<String> candidateData, rejectedData){
                              return Container();
                            },
                            onWillAccept: (String data){
                              if(data == _gameList[3]['data']){
                                return true;
                              }
                              return false;
                            },
                            onAccept: _onAccept,
                            onLeave: _onReject,
                          ),
                        ),
                        Container(
                          color: _gameList[4]['color'],
                          child: DragTarget(
                            builder:
                                (context, List<String> candidateData, rejectedData){
                              return Container();
                            },
                            onWillAccept: (String data){
                              if(data == _gameList[4]['data']){
                                return true;
                              }
                              return false;
                            },
                            onAccept: _onAccept,
                            onLeave: _onReject,
                          ),
                        ),
                        Container(
                          color: _gameList[5]['color'],
                          child: DragTarget(
                            builder:
                                (context, List<String> candidateData, rejectedData){
                              return Container();
                            },
                            onWillAccept: (String data){
                              if(data == _gameList[5]['data']){
                                return true;
                              }
                              return false;
                            },
                            onAccept: _onAccept,
                            onLeave: _onReject,
                          ),
                        ),
                        Container(
                          color: _gameList[6]['color'],
                          child: DragTarget(
                            builder:
                                (context, List<String> candidateData, rejectedData){
                              return Container();
                            },
                            onWillAccept: (String data){
                              if(data == _gameList[6]['data']){
                                return true;
                              }
                              return false;
                            },
                            onAccept: _onAccept,
                            onLeave: _onReject,
                          ),
                        ),
                        Container(
                          color: _gameList[7]['color'],
                          child: DragTarget(
                            builder:
                                (context, List<String> candidateData, rejectedData){
                              return Container();
                            },
                            onWillAccept: (String data){
                              if(data == _gameList[7]['data']){
                                return true;
                              }
                              return false;
                            },
                            onAccept: _onAccept,
                            onLeave: _onReject,
                          ),
                        ),
                        Container(
                          color: _gameList[8]['color'],
                          child: DragTarget(
                            builder:
                                (context, List<String> candidateData, rejectedData){
                              return Container();
                            },
                            onWillAccept: (String data){
                              if(data == _gameList[8]['data']){
                                return true;
                              }
                              return false;
                            },
                            onAccept: _onAccept,
                            onLeave: _onReject,
                          ),
                        ),
                      ],
                  ),
                ),
              ),
            ),
            Container(
//              width: 80,
//              height: 80,
//              color: Colors.white,
              margin:EdgeInsets.only(bottom: 200),
              child: Draggable(
                data: _selected['data'],
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                  child: Center(child: Text(_selected['data'], style: Theme.of(context).textTheme.headline,),),
                ),
                childWhenDragging: Container(),
                feedback: Container(
                  child: Center(
                    child: Text(_selected['data'], style: Theme.of(context).textTheme.headline,),),
                  color: Colors.blue[300],
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}