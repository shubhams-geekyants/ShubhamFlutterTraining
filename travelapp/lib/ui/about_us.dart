import 'package:flutter/material.dart';
import 'package:travelapp/ui/app_bar.dart';

class AboutUs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: MyAppBar('About Us'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              height: 100,
//              color: Colors.teal,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:Image.asset('assets/icons/icon.png'),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:Image.asset('assets/icons/icon.png'),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:Image.asset('assets/icons/icon.png'),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:Image.asset('assets/icons/icon.png'),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:Image.asset('assets/icons/icon.png'),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:Image.asset('assets/icons/icon.png'),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:Image.asset('assets/icons/icon.png'),
                        ),

                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 20),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 7),
                        child: Text('Our produtct', style: TextStyle(
                            color: Colors.black87
                        )),
                      )
                    ],
                  )
                ],
              ),
            ),
            Card(
              elevation: 4,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 3,
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
//                          padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset('assets/images/taj.png',
                          height: 300,
                          fit: BoxFit.cover
                      ),
                    ),
                    ListTile(
//                          leading: Icon(Icons.location_on),
                      title: Text('Taj Mahal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      subtitle: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('Agra', textAlign: TextAlign.end),
                            Icon(Icons.location_on, color: Colors.black26),
                          ],
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color:Colors.teal,
                          elevation: 0,
                          child: const Text('LET\'S GO',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.white
                              )
                          ),
                          onPressed: () { /* ... */ },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 3,
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
//                          padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset('assets/images/taj.png',
                          height: 300,
                          fit: BoxFit.cover
                      ),
                    ),
                    ListTile(
//                          leading: Icon(Icons.location_on),
                      title: Text('Taj Mahal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      subtitle: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('Agra', textAlign: TextAlign.end),
                            Icon(Icons.location_on, color: Colors.black26),
                          ],
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color:Colors.teal,
                          elevation: 0,
                          child: const Text('LET\'S GO',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.white
                              )
                          ),
                          onPressed: () { /* ... */ },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 3,
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
//                          padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset('assets/images/taj.png',
                          height: 300,
                          fit: BoxFit.cover
                      ),
                    ),
                    ListTile(
//                          leading: Icon(Icons.location_on),
                      title: Text('Taj Mahal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      subtitle: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('Agra', textAlign: TextAlign.end),
                            Icon(Icons.location_on, color: Colors.black26),
                          ],
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color:Colors.teal,
                          elevation: 0,
                          child: const Text('LET\'S GO',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.white
                              )
                          ),
                          onPressed: () { /* ... */ },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 3,
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
//                          padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset('assets/images/taj.png',
                          height: 300,
                          fit: BoxFit.cover
                      ),
                    ),
                    ListTile(
//                          leading: Icon(Icons.location_on),
                      title: Text('Taj Mahal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      subtitle: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('Agra', textAlign: TextAlign.end),
                            Icon(Icons.location_on, color: Colors.black26),
                          ],
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color:Colors.teal,
                          elevation: 0,
                          child: const Text('LET\'S GO',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.white
                              )
                          ),
                          onPressed: () { /* ... */ },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 3,
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
//                          padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset('assets/images/taj.png',
                          height: 300,
                          fit: BoxFit.cover
                      ),
                    ),
                    ListTile(
//                          leading: Icon(Icons.location_on),
                      title: Text('Taj Mahal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      subtitle: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('Agra', textAlign: TextAlign.end),
                            Icon(Icons.location_on, color: Colors.black26),
                          ],
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color:Colors.teal,
                          elevation: 0,
                          child: const Text('LET\'S GO',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.white
                              )
                          ),
                          onPressed: () { /* ... */ },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

}