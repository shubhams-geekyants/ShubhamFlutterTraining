import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:travelapp/service/gql_qery.dart';
import 'package:travelapp/service/graphql_config.dart';
import 'package:travelapp/service/mutation_query.dart';
import 'package:travelapp/storage/token.dart';

import 'package:travelapp/ui/about_us.dart';
import 'package:travelapp/ui/travel_with_us.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  int _selectedPage;
  int _isLoading = 0;
  GlobalKey _globalKey = GlobalKey();
  final GraphQLConfig _graphQLConfig = GraphQLConfig();
  final GraphQLQuery _query = GraphQLQuery();
  WebViewController _controller;
  static List<String> _urlList = [
    'https://geekyants.com/',
    'https://geekyants.com/ux',
    'https://geekyants.com/products',
    'https://geekyants.com/blog',
    'https://geekyants.com/team',
    'https://geekyants.com/current-openings',
  ];

  List<Widget> _widgets;

  void _onBottomNavigationTap(int index){
    setState(() {
      _selectedPage = index;
    });
  }

  Future _getUserData() async{
    GraphQLClient _client = _graphQLConfig.clientToQuery(token: Token.token);
    QueryResult _result = await _client.query(
      QueryOptions(
        document: _query.getUser()
      )
    );
    return _result;
  }

  dynamic _onSideDrawerTap(int index){
    return (){
      setState(() {
        _controller.loadUrl(_urlList.elementAt(index));
      });
    };
  }
  void _handleLoadStart(String value) {
    setState(() {
      _isLoading = 1;
    });
  }

  void _handleLoadFinished(String value) {
    setState(() {
      _isLoading = 0;
    });
  }
  @override
  void initState() {
//    if(Token.type != 'ACCESS') Navigator.pushReplacementNamed(context, '/login');
    super.initState();
    _widgets = <Widget>[
      Scaffold(
        key: _globalKey,
        appBar: AppBar(
          title: Container(
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Text('TravelApp', style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                )),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: _getUserData(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                if(snapshot.data.hasException){
                  return Center(child: Text('Something went wrong'));
                }
                if(!snapshot.data.data['getUser']['isLoggedIn']){
                  return Center(child: Text('User not loggedin'));
                } else{
                  var data = snapshot.data.data['getUser'];
                  return Center(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                                padding:EdgeInsets.only(top:30),
                                child: Text('Name: ${data['name']}')
                            ),
                          ),
                          Center(
                            child: Container(
                                padding:EdgeInsets.only(top:30),
                                child: Text('Email: ${data['email']}')
                            ),
                          ),
                          Center(
                            child: Container(
                                padding:EdgeInsets.only(top:30),
                                child: Text('Mobile No.: ${data['mobileNumber']}')
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
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
                    'Home'
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
                      'UI\\UX'
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
                      'Products'
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
                      'Blogs'
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
                      'Team'
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
                      'Jobs'
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