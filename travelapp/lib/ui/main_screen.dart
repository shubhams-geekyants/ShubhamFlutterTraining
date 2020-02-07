import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:travelapp/ui/about_us.dart';
import 'package:travelapp/ui/home.dart';
import 'package:travelapp/ui/travel_with_us.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  int _selectedPage;
  WebViewController _controller;
  static List<String> _urlList = [
    'https://cloud.google.com/',
    'https://facebook.com'
  ];
//  static List<String> _logoList = <String>[
//    'assets/icons/cloud_engine.png',
//    'assets/icons/facebook.png',
//    'assets/icons/google_analytics.png',
//    'assets/icons/instagram.png',
//    'assets/icons/linkedin.png',
//    'assets/icons/twiter.png',
//  ];
  List<Widget> _widgets;

  void _onBottomNavigationTap(int index){
    setState(() {
      _selectedPage = index;
    });
  }
  dynamic _onSideDrawerTap(int index){
    return (){
      setState(() {
        _controller.loadUrl(_urlList.elementAt(index));
      });
    };
  }
  @override
  void initState() {
    super.initState();
    _widgets = <Widget>[
      SafeArea(
        child: Container(
//          child: WebView(
//            initialUrl: 'https://cloud.google.com/',
//            javascriptMode: JavascriptMode.unrestricted,
//          ),
        ),
      ),
      TravelWithUs(),
      AboutUs(),
    ];
    _selectedPage = 0;
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: CircleAvatar(
                    radius: 150,
//                    backgroundColor: Colors.teal,
                    child: Image.asset('assets/icons/icon.png'),
                  ),
                )
              ),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Text(
                    'Google Colud Engine'
                  ),
                ],
              ),
              onTap: _onSideDrawerTap(0),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Text(
                      'Facebook'
                  ),
                ],
              ),
              onTap: _onSideDrawerTap(1),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Text(
                      'Google Analytics'
                  ),
                ],
              ),
              onTap: _onSideDrawerTap(2),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Text(
                      'Instagram'
                  ),
                ],
              ),
              onTap: _onSideDrawerTap(3),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Text(
                      'LinkedIn'
                  ),
                ],
              ),
              onTap: _onSideDrawerTap(4),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Text(
                      'Twiter'
                  ),
                ],
              ),
              onTap: _onSideDrawerTap(5),
            ),
          ],
        ),
      ),
      body: _widgets.elementAt(_selectedPage),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
//        elevation: 5,
        child: BottomNavigationBar(
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.place),
              title: Text('Places'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('About Us'),
            ),
          ],
          currentIndex: _selectedPage,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.teal[300],
          onTap: _onBottomNavigationTap,
        ),
      ),
    );
  }

}