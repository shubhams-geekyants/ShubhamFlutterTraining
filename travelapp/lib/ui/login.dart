import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:travelapp/service/gql_qery.dart';
import 'package:travelapp/service/graphql_config.dart';
import 'package:travelapp/storage/token.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginState();

}

class _LoginState extends State<Login>{
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  int _loading = 0;
  GraphQLConfig _graphQLConfig = GraphQLConfig();
  GraphQLQuery _graphQLQuery = GraphQLQuery();
  void _onSubmit() async {
    setState(() {
      _loading = 1;
    });
    GraphQLClient _client = _graphQLConfig.clientToQuery(token: Token.token);
    QueryResult _result = await _client.query(
        QueryOptions(
          // ignore: deprecated_member_use
          document: _graphQLQuery.login(
            mobileNumber: '+91'+ _mobileNumber.text,
            password: _password.text
          ),
        )
    );
    if(!_result.hasException){
//      print(_result.data['login']['isLoggedIn'].runtimeType);
      if(_result.data['login']['isLoggedIn']){
        Token.token = _result.data['login']['accessToken'];
        Token.refreshToken = _result.data['login']['refreshToken'];
        Token.type = 'ACCESS';
        Navigator.pushReplacementNamed(context, '/main_screen');
      }else{
        Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '${_result.data['login']['message'][0].toUpperCase()}'
                      '${_result.data['login']['message'].substring(1)}',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              action: SnackBarAction(
                  label: 'Close',textColor: Colors.white,
                  onPressed: (){
                  },
              ),
            ),
        );
      }
    }
    setState(() {
      _loading = 0;
    });
  }

  @override
  void initState(){
    Token.token = '';
    Token.type = '';
    Token.mobileNumber = '';
    _mobileNumber.text = '';
    _password.text = '';
    _loading = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return SingleChildScrollView(
      child: Container(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 70, 20, 0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          child: Image.asset('assets/icons/icon.png'),
                          backgroundColor: Colors.transparent,
                          radius: 50,
                        ),
                      ),
                      Container(
                        child: Text('TravelApp',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 50,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Text('Sign In',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight:
                                FontWeight.bold
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextField(
                          controller: _mobileNumber,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            hintText: 'Mobile Number',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: TextField(
                          obscureText: true,
                          controller: _password,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Forget Password?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: IndexedStack(
                          index: _loading,
                          children: <Widget>[
                            RaisedButton(
                              elevation: 10,
                              onPressed: _onSubmit,
                              child: Icon(Icons.arrow_forward, color: Colors.white),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                              color: Colors.teal,
                            ),
                            FlatButton(
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: RaisedButton(
                            onPressed: _loading == 0 ?(){
                              Navigator.pushNamed(context, '/otp');
                            }:null,
                            color: Colors.teal,
                            child: Text('create account'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

}