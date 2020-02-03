import 'dart:io';

import 'package:booking/booking.dart';


class Handler{
  String _query;
  Map<String, String> _keyList;
  Handler(){
    _keyList = {
      'NAME': 'name',
      'PHONENUMBER': 'phoneNo',
      'PHONENO': 'phoneNo',
      'AGE': 'age',
      'STREET': 'street',
      'CITY': 'city',
      'STATE': 'state',
      'POSTALCODE': 'postalCode',
      'COUNTRY': 'country',
      'SHEETS': 'sheets'
    };
  }

  /// method [_printHelp] to print help menu
  void _printHelp(){
    print('\nUsage: <query>\n'
        'Enter query using given list\n'
        '1. BOOK {ROLE} NAME:{PASENGER_NAME} PHONENUMBER:{PHONE_NUMBER} '
        'SHEETS:{NO_OF_SHEETS} AGE:{AGE} STREET:{STREET}(optional) '
        'CITY:{CITY_FULL_NAME} STATE:{STATE_FULL_NAME} POSTALCODE:{POSTALCODE}\n'
        '   COUNTRY:{COUNTRY_NAME}\n'
        '   Notes: a. ROLE -> VALUES(AIRLINE, BUS, RAILWAY)\n'
        '          b. AGE -> VALUE(INT)\n'
        '          c. VALUE should not be space separated USE _ inplace of '
        '\'space\' in VALUE\n'
        '   Example: book bus name:shubham_srivastava '
        'phonenumber:9170647101 age:21 city:greater_noida '
        'state:uttar_pradesh postalcode:201306 country:india\n'
        '2. AVAILABLE {TYPE} for checking available sheets\n'
        '   Notes: a. TYPE -> VALUE(AIRLINE, BUS, RAILWAY, ALL)\n'
        '3. QUIT or \\Q or EXIT or \\E to quit\n'
        '4. HELP or \\H or --HELP for help\n');
  }

  /// method [_keyValueMap] return map by parsing the query
  Map<String, String> _keyValueMap(List<String> keyValueList){
    var dataToReturn = <String, String>{};
    for(var index = 0; index < keyValueList.length; index++){
      var keyValue = keyValueList[index].split(':');
      if(keyValue.length != 2){
        throw('invalid key value pair in query \n'
            'use HELP or -H or --HELP for help');
      }
      if(_keyList[keyValue[0]] == null){
        throw('invalid key \'${keyValue[0]}\'\n'
            'use HELP or -H or --HELP for help');
      }
      dataToReturn[_keyList[keyValue[0]]] = keyValue[1].split('_').join(' ');
    }
    return dataToReturn;
  }

  /// method [_resolveQuery] resolve the query entered by user
  void _resolveQuery(List<String> query){
    Map<String, String> queryToMap;
    if(query.length < 2){
      print(_query);
      print('^ -> invalid query');
      print('Use HELP or \\H or --HELP for help');
      return;
    }
    try {
      if(query[0] == 'BOOK'){
        queryToMap = _keyValueMap(query.sublist(2));
        if(queryToMap['name'] == null){
          throw('\'NAME\' parameter is required');
        }
        if(queryToMap['phoneNo'] == null){
          throw('\'PHONENUMBER\' parameter is required');
        }
        var newBooking = Booking(
            city: queryToMap['city'],
            country: queryToMap['country'],
            postalCode: queryToMap['postalCode'],
            state: queryToMap['state'],
            street: queryToMap['street']);
        var isBooked = true;
        switch(query[1]){
          case 'AIRLINE':
          case 'BUS':
          case 'RAILWAY':
            var noOfSheets = 0;
            if(queryToMap['sheets'] != null) {
              noOfSheets = int.parse(queryToMap['sheets']);
            }
            if(noOfSheets == 0) {
              isBooked = Booking.book(query[1]);
            } else{
              var num = 0;
              for(num = 0; num < noOfSheets && isBooked; num++){
                isBooked = Booking.book(query[1]);
              }
              if(!isBooked){
                stdout.write('${queryToMap['name']}\t${queryToMap['phoneNo']}'
                    '\t\t${query[1]} ${num-1} TICKET BOKKED ✅ & '
                    '${noOfSheets - num + 1} TICKET BOOKING FIALD ❌ (Sheet full)\n');
                return;
              }else{
                stdout.write('${queryToMap['name']}\t${queryToMap['phoneNo']}'
                    '\t\t${query[1]} ${num} TICKET BOKKED ✅ \n');
                return;
              }
            }
            break;
          default: throw('\'ROLE\' must be (AIRLINE, BUS, RAILWAY)');
        }
        stdout.write('${queryToMap['name']}\t${queryToMap['phoneNo']}\t\t${query[1]} TICKET');
        if(isBooked){
          print(' BOKKED ✅');
        }else{
          print(' BOOKING FIALD ❌ (Sheet full)');
        }
      } else if(query[0] == 'AVAILABLE'){
        switch(query[1]){
          case 'AIRLINE':
            print('AIRLINE -> ${Booking.available('AIRLINE')}');
            break;
          case 'BUS':
            print('BUS -> ${Booking.available('BUS')}');
            break;
          case 'RAILWAY':
            print('RAILWAY -> ${Booking.available('RAILWAY')}');
            break;
          case'ALL':
            print('AIRLINE -> ${Booking.available('AIRLINE')}');
            print('BUS -> ${Booking.available('BUS')}');
            print('RAILWAY -> ${Booking.available('RAILWAY')}');
            break;
          default: throw('\'type\' value must be (AIRLINE, BUS, RAILWAY, ALL)');
        }
      }
      else {
        print(_query);
        print('^ -> invalid operations, use BOOK only');
      }
    }catch(e){
      print(e);
    }
  }

  /// method [begin] to start handler
  void begin(){
    _printHelp();
    do{
      stdout.write('query> ');
      _query = stdin.readLineSync().toUpperCase();
      if(_query != 'QUIT'&&_query != 'EXIT'&&_query != '\\Q'&&_query != '\\E'){
        if(_query == 'HELP'||_query == '\\H'||_query == '--HELP'){
          _printHelp();
        }else{
          //resolve the query
          List<String> splitQuery;
          splitQuery = _query.split(' ');
          _resolveQuery(splitQuery);
        }
      }else{
        print('Good Bye :-)');
        return;
      }
    }while(true);
  }
}