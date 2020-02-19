import 'dart:math';

import 'package:flutter/material.dart';

class Match extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Match();
}

class _Match extends State<Match>{
  String _dropData;
  Map<String, String> _selected;
  int _score = 0, _life = 3;
  final _random = Random();
  final List<Map<String, String>> _gameList=[
    {
      'question':'⛱️',
      'data': '1',
    },
    {
      'question':'💣',
      'data': '2',
    },
    {
      'question':'🖼️',
      'data': '3',
    },
    {
      'question':'🔪',
      'data': '4',
    },
    {
      'question':'📻',
      'data': '5',
    },
    {
      'question':'📸',
      'data': '6',
    },
    {
      'question':'🔦',
      'data': '7',
    },
    {
      'question':'🔑',
      'data': '8',
    },
  ];

  void _onAccept(String data){
    print(data +':'+_dropData);
    print('Accepted');
    if(_life != 0){
      if(data == _dropData){
        setState(() {
          _score = _score+2;
          _selected = _gameList[_random.nextInt(_gameList.length)];
        });
      }
      else{
        setState(() {
          _score--;
          _life--;
          _selected = _gameList[_random.nextInt(_gameList.length)];
        });
      }
    }
    if(_life == 0){
      popup();
    }
  }

  Widget _showLife(){
    List<Widget>_build = <Widget>[];
    _build.add(
        Container(
          padding: EdgeInsets.all(5),
          child: Text('Score:\t\t$_score️', style: TextStyle(color: Colors.white)),
        )
    );
    for(var i = 0; i < _life; i++){
      _build.add(
          Container(
            padding: EdgeInsets.all(5),
            child: Text('❤️'),
          )
      );
    }

    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: _build
      ),
    );
  }

  void popup(){
    showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Center(child:Text('Score')),
        content: Center(
            heightFactor: .5,
            child: Text('$_score', style: TextStyle(fontSize: 30))
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              setState(() {
                _life = 3;
                _score = 0;
              });
              Navigator.pop(context);
            },
            child: Text('Reset'),
          )
        ],
      )
    );
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
              flex: 9,
              child: Container(
                child: Center(
                  child: GridView.builder(
                      primary: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10
                      ),
                      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                      itemCount: _gameList.length,
                      itemBuilder: (context, index)=>Container(
                        color: Colors.white,
                        child: DragTarget(
                          builder:
                              (context, List<String> candidateData, rejectedData){
                            return Container(
                              child: Center(
                                child: Text(
                                    _gameList[index]['question'],
                                    style: TextStyle(
                                      fontSize: 30
                                    )
                                ),
                              ),
                            );
                          },
                          onWillAccept: (String data){
                            setState(() {
                              _dropData = _gameList[index]['data'];
                              print(_dropData);
                            });
                            return true;
                          },
                          onAccept: _onAccept,
                        ),
                      ),
                  ),
                ),
              ),
            ),
            Container(
//              width: 80,
//              height: 80,
//              color: Colors.white,
              padding: EdgeInsets.only(bottom: 30),
              child: Draggable(
                data: _selected['data'],
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      '⁉️',
                      style: TextStyle(
                        fontSize: 30
                      ),
                    ),
                  ),
                ),
                childWhenDragging: Container(),
                feedback: Container(
                  child: Center(
                    child: Text(
                      '⁉️',
                      style: TextStyle(
                          fontSize: 30
                      ),
                    ),
                  ),
                  color: Colors.white70,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: _showLife(),
              ),
            )
          ],
        ),
      ),
    );
  }
}