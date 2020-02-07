import 'package:flutter/material.dart';
import'package:learning_app/dynamic_color.dart';

class Layout extends StatelessWidget{

  Layout({Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 2, spreadRadius: 1)]
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 750.8/6*4,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 411.4/2,
//                      decoration: BoxDecoration(color: Colors.indigoAccent),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 720/6*2,
                            margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: DynamicColor(
                              child: Center(
                                child: Text('Hi', style: TextStyle(
                                    fontFamily: 'AleoRegular',
                                    fontSize: 60,
                                    color: Colors.white
                                )),
                              ),
                            ),
                          ),
                          Container(
                            height: 720/6*2,
                            margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                            child: DynamicColor(
                              child: Center(
                                child: Icon(Icons.lightbulb_outline,
                                    color: Colors.white, size: 100),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 411.4/2,
//                      decoration: BoxDecoration(color: Colors.indigoAccent),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 720/6,
                            margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: DynamicColor(
                              child: Center(
                                child: Icon(Icons.cake, color: Colors.white, size: 70),
                              ),
                            ),
                          ),
                          Container(
                            height: 740/6*3,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 411.4/4,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 700/6*2,
                                        margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                                        child: DynamicColor(
                                          child: Center(
                                            child: Icon(Icons.add_a_photo,
                                                color: Colors.white, size: 50),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 700/6,
                                        margin: EdgeInsets.fromLTRB( 5, 10 , 5, 0),
                                        child: DynamicColor(
                                          child: Center(
                                            child: Icon(Icons.airline_seat_recline_extra,
                                                color: Colors.white, size: 50),
                                          ),
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 411.4/4,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 700/6,
                                        margin: EdgeInsets.fromLTRB( 5, 10 , 10, 0),

                                        child: DynamicColor(
                                          child: Center(
                                            child: Icon(Icons.bluetooth_audio,
                                                color: Colors.white, size: 50),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 700/6*2,
                                        margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                        child: DynamicColor(
                                          child: Center(
                                            child: Icon(Icons.call,
                                                color: Colors.white, size: 50),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 750.8/6,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 285,
                      margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: DynamicColor(
                        child: Center(
                          child: Text('Hello', style: TextStyle(
                              fontFamily: 'ActorRegular',
                              fontSize: 60,
                              color: Colors.white
                          )),
                        ),
                      ),
                    ),
                    Container(
                      width: 95,
                      margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                      child: DynamicColor(
                        child: Center(
                          child: Icon(Icons.print, color: Colors.white, size: 50),
                        ),
                      ),
                    ),
                  ],
                )
              ),
              Container(
                height: 750.8/6,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: DynamicColor(
                    child: Center(
                      child: Text('World', style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 80,
                          color: Colors.white
                      )),
                    ),
                  ),
                )
              ),
            ],
          ),
        )
      )
    );
  }

}