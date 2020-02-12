import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:travelapp/service/graphql_config.dart';
import 'package:travelapp/service/mutation_query.dart';
import 'package:travelapp/ui/app_bar.dart';
import 'package:travelapp/storage/token.dart';

class Otp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OtpState();
}

class _OtpState extends State<Otp>{

  TextEditingController _mobileNumber = TextEditingController(text: '');
  bool _isLoading = false;
  set _loading(bool state){
    setState(() {
      _isLoading = state;
    });
  }
  GraphQLConfig _graphQLConfig = GraphQLConfig();
  GraphQLMutation _mutation = GraphQLMutation();
  Widget _next(){
    if(!_isLoading){
      return RaisedButton(
        onPressed: () async {
          print('hi');
          try{
            int.parse(_mobileNumber.text);
          }catch(e){
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Container(
                  padding: EdgeInsets.only(left:20),
                  child: Text('Invalid mobile number')
                ),
              )
            );
            return;
          }
          if(!_isLoading && _mobileNumber.text.length == 10){
            _loading = true;
            GraphQLClient _client = _graphQLConfig.clientToQuery(token: Token.token);
            QueryResult _result = await _client.mutate(
                MutationOptions(
                  // ignore: deprecated_member_use
                  document: _mutation.sendOtp(
                    deviceId: Token.deviceId,
                    mobileNumber: '+91'+ _mobileNumber.text,
                  ),
                )
            );
            _loading = false;
            if(_result.hasException){
              print('error');
              print(_result.exception);
            }else{
              if(_result.data['sendOtp']['isGenerated'] == true){
                Token.token = _result.data['sendOtp']['token'];
                Token.mobileNumber = '+91'+_mobileNumber.text;
                Token.type = 'VERIFY_MOBILE';
                Navigator.pushReplacementNamed(context, '/validate-otp');
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
      return CircularProgressIndicator();
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        controller: _mobileNumber,
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            hintText: 'Phone Number'
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40, left: 40,right: 40),
                      child: _next(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }

}