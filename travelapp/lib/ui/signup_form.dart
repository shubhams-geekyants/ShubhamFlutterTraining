import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/service/mutation_query.dart';
import 'package:travelapp/service/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:travelapp/storage/token.dart';

class SignUpForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SignUpFromState();

}

class _SignUpFromState extends State<SignUpForm>{
  int _index;
  bool _secure = true;
  final GraphQLConfig _graphQLConfig = GraphQLConfig();
  final GraphQLMutation _mutation = GraphQLMutation();
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _validEmail = true, _validName = false, _validPassword = false;
  String _nameError;
  String _isValidName(){
    print(_validName);
    if(_validName){
      return null;
    }else{
      print('hi');
      if(_name.text.isEmpty){
        print(_name.text);
        return 'Name is required';
      }else{
        return null;
      }
    }
  }




  dynamic _onSubmit(context) {
    return ()async{
      setState(() {
        _index = 1;
      });
      if(_name.text.isEmpty) return;
      if(_email.text.isEmpty) return;
      if(_password.text.isEmpty) return;
      GraphQLClient _client = _graphQLConfig.clientToQuery(token: Token.token);
      QueryResult _result = await _client.mutate(
          MutationOptions(
            // ignore: deprecated_member_use
            document: _mutation.addUser(
                Token.deviceId,
                _email.text, _name.text,
                _password.text),
          )
      );

      if(_result.hasException){
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Container(
              padding: EdgeInsets.only(left: 20),
              child: Text('Something went wrong'),
            )
        ));
        setState(() {
          _index = 0;
        });
      }else{
        print(_result.data);
        if(_result.data['addUser']['isAdded'] == true){
          Token.token = _result.data['addUser']['accessToken'];
          Token.refreshToken = _result.data['addUser']['refreshToken'];
          Token.type = 'ACCESS';
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/main_screen');
        }else{
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(_result.data['addUser']['message']),
              )
          ));
          setState(() {
            _index = 0;
          });
        }
      }
    };
  }

  @override
  void initState(){
    _index = 0;
    _secure = true;
    _email.text = '';
    _name.text = '';
    _password.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Container(
          color: Colors.white,
          alignment: Alignment.bottomCenter,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Image.asset('assets/icons/icon.png'),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        alignment: Alignment.bottomCenter,
                        child: TextField(
                          controller: _name,
                          onChanged: (String value){
                            setState(() {
                              _nameError = _isValidName();
                            });
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(Icons.perm_identity),
                              hintText: 'Name',
                              errorText: _nameError,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        alignment: Alignment.bottomCenter,
                        child: TextField(
                          controller: _email,
                          onChanged: (String value){
                            setState(() {
                              _validName = false;
                              _nameError = _isValidName();
                              print(_validName);
                            });
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: 'Emial'
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        alignment: Alignment.bottomCenter,
                        child: TextField(
                          obscureText: _secure,
                          controller: _password,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _secure?Icons.visibility_off:Icons.visibility
                              ),
                              onPressed: (){
                                setState(() {
                                  _secure = !_secure;
                                });
                              },
                            ),
                            hintText: 'Password'
                          ),
                        ),
                      ),
                      IndexedStack(
                        index: _index,
                        children: <Widget>[
                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                              child: RaisedButton(
                                color: Colors.teal,
                                onPressed: _onSubmit(context),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                                  child: Text('Signup', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                            child: Center(
                                child: CircularProgressIndicator()
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
    );
  }

}