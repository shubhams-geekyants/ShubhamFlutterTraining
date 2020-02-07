import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginState();

}

class _LoginState extends State<Login>{


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
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
                          controller: email,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: TextField(
                          obscureText: true,
                          controller: password,
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
                        child: RaisedButton(
                          elevation: 10,
                          onPressed: (){
                            print(email.text);
                            print(password.text);
                            if(email.text == 'shubham' &&
                                password.text == 'Shubham@'){
                              print('here');
                              Navigator.pushReplacementNamed(context, '/main_screen');
                            }
                          },
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          color: Colors.teal,
                        ),
                      ),
                      Container(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: RaisedButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/travel_with_us');
                            },
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