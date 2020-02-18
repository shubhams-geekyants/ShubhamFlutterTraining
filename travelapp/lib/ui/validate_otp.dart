import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:travelapp/service/gql_qery.dart';
import 'package:travelapp/service/graphql_config.dart';
import 'package:travelapp/ui/app_bar.dart';
import 'package:travelapp/storage/token.dart';

class ValidateOtp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ValidateOtpState();
}

class _ValidateOtpState extends State<ValidateOtp>{
  String _error;
  TextEditingController _code = TextEditingController(text: '');
  bool _isLoading = false;
  set _loading(bool state){
    setState(() {
      _isLoading = state;
    });
  }
  GraphQLConfig _graphQLConfig = GraphQLConfig();
  GraphQLQuery _graphQLQuery = GraphQLQuery();
  Widget _next(context){
    if(!_isLoading){
      return RaisedButton(
        onPressed: () async {
          try{
            int.parse(_code.text);
          }catch(e){
            return;
          }
          if(!_isLoading && _code.text.length == 4 && Token.type == 'VERIFY_MOBILE'){
            _loading = true;
            GraphQLClient _client = _graphQLConfig.clientToQuery(
              token: Token.token,
            );
            print(_graphQLQuery.validateOtp(Token.deviceId, _code.text));
            QueryResult _result = await _client.query(
                QueryOptions(
                  // ignore: deprecated_member_use
                  document: _graphQLQuery.validateOtp(Token.deviceId, _code.text),
                )
            );
            _loading = false;
            if(_result.hasException){
              print('error');
              print(_result.exception);
            }else{
              print(_result.data);
              if(_result.data['validateOtp']['isValid'] == true){
                Token.token = _result.data['validateOtp']['token'];
                Token.type = 'ADD_USER';
                Navigator.pushReplacementNamed(context, '/signup-from');
              }else{
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(_result.data['validateOtp']['message']),
                    ),
                    action: SnackBarAction(label: 'Close', textColor: Colors.white,
                      onPressed: (){}),
                  )
                );
              }
            }
          }
        },
        color: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Next', style: TextStyle(fontSize: 30,color: Colors.white)),
            SizedBox(width: 15),
            Icon(Icons.arrow_forward, size: 30, color: Colors.white),
          ],
        ),
      );
    }else{
      return Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child:Center(
            child:CircularProgressIndicator()
          ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    if(Token.token.isEmpty) {
      Navigator.pushReplacementNamed(context, '/login');
      return null;
    }else{
      return Scaffold(
        appBar: AppBar(
          title: MyAppBar('Signup'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
//                        alignment: Alignment.bottomCenter,
                        child: TextField(
                          controller: _code,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              errorText: _error,
                              hintText: 'OTP'
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40, left: 40,right: 40),
                        child: _next(context),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

}