import 'dart:io';

import 'package:university_management/student.dart';
import 'package:university_management/professor.dart';
import 'package:university_management/university.dart';


class Handler{
  String _query;
  Map<String, dynamic> _enrolledPerson;
  Map<String, String> _keyList;
  Map<String, University> _universityList;
  Handler(){
    _universityList = <String, University>{};
    _enrolledPerson = <String, dynamic>{};
    _keyList = {
      'NAME': 'name',
      'EMAIL': 'email',
      'PHONENO': 'phoneNo',
      'AGE': 'age',
      'STREET': 'street',
      'CITY': 'city',
      'STATE': 'state',
      'POSTALCODE': 'postalCode',
      'COUNTRY': 'country',
      'UNIVERSITYID': 'universityId',
      'UNIVERSITYNAME':'universityName',
      'BRANCHNAME':'branchName',
      'BRANCHID':'branchId',
      'COURSENAME':'courseName',
      'COURSEID':'courseId',
      'HIGHESTEDUCATION':'highestEducation',
      'PASSEDYEAR':'passedYear',
      'AVERAGEMARK':'avgMark',
      'EXPERIENCEINYEARS':'experienceInYears',
      'PROFICIENCY': 'proficiency',
      'SALARY': 'salary',
      'SKILLS': 'skills',
      'UNIVERSITY': 'university',

    };
    var newUniversity = University(
        state: 'Uttar Pradsesh',
        country: 'India',
        city: 'Lucknow',
        name: 'AKTU',
        email: 'support@aktu.co.in',
        postalCode: '201310');
    newUniversity.operations(
        operation: 'add:many:branch',
        value:[
          {'state': 'Uttar Pradsesh',
            'country': 'India',
            'city': 'Greater Noida',
            'name': 'ABC',
            'postalCode': '201310'},
          {'state': 'Uttar Pradsesh',
            'country': 'India',
            'city': 'Greater Noida',
            'name': 'PQR',
            'postalCode': '201310'},
          {'state': 'Uttar Pradsesh',
            'country': 'India',
            'city': 'Lucknow',
            'name': 'ABC',
            'postalCode': '201310'},
        ]);
    newUniversity.operations(
        operation: 'add:many:course',
        value: [
          {'name': 'BTech',
            'duration': 4},
          {'name': 'MTech',
            'duration': 2},
          {'name': 'BCA',
            'duration': 3},
          {'name': 'MCA',
            'duration': 2},
        ]);
    _universityList[newUniversity.universityId] = newUniversity;
    newUniversity = University(
        state: 'Uttar Pradsesh',
        country: 'India',
        city: 'Greater Noida',
        name: 'Amity',
        email: 'support@amity.co.in',
        postalCode: '201310');
    newUniversity.operations(
        operation: 'add:many:branch',
        value:[
          { 'state': 'Uttar Pradsesh',
            'country': 'India',
            'city': 'Greater Noida',
            'name': 'MNO',
            'postalCode': '201310'},
          { 'state': 'Uttar Pradsesh',
            'country': 'India',
            'city': 'Greater Noida',
            'name': 'ABCD',
            'postalCode': '201310'},
          { 'state': 'Uttar Pradsesh',
            'country': 'India',
            'city': 'Lucknow',
            'name': 'MNOP',
            'postalCode': '201310'},
        ]);
    newUniversity.operations(
        operation: 'add:many:course',
        value: [
          {'name': 'BTech',
            'duration': 4},
          {'name': 'MTech',
            'duration': 2},
          {'name': 'BCA',
            'duration': 3},
          {'name': 'MCA',
            'duration': 2},
        ]);
    _universityList[newUniversity.universityId] = newUniversity;
  }

  /// method [_printHelp] to print help menu
  void _printHelp(){
    print('\nUsage: <query>\n'
        'Enter query using given list\n'
        '1. ENROL {ROLE} NAME:{FULL_NAME} EMAIL:{EMAIL} PHONENO:{PHONE NUMBER}'
        '(optional) AGE{AGE} STREET:{STREET}(optional) CITY:{CITY_FULL_NAME}\n'
        '   STATE:{STATE_FULL_NAME} POSTALCODE:{POSTALCODE} '
        'COUNTRY:{COUNTRY_NAME} (optional paramters)\n'
        '   Notes: a. ROLE -> VALUES(STUDENT, PROFESSOR)\n'
        '          b. AGE -> VALUE(INT)\n'
        '          c. OPTIONAL are not required option\n'
        '          d. VALUE should not be space separated USE _ inplace of '
        '\'space\' in VALUE\n'
        '   Example: enrol student name:shubham_srivastava '
        'email:shubham9918sri@gmail.com age:21 city:greater_noida '
        'state:uttar_pradesh postalcode:201306 country:india\n'
        '2. QUIT or \\Q or EXIT or \\E to quit\n'
        '3. HELP or \\H or --HELP for help\n'
        '4. GROUP BY CITY:{1} UNIVERSITY:{1} to display filterd list');
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

  /// method [_selectUniversity] use to select university Id from list
  String _selectUniversity(){
    String selectedId;
    var idList = <String>[];
    print('-----------------------------LIST----------------------------');
    print('|     Id     |                   Name                       |');
    print('-------------------------------------------------------------');
    _universityList.forEach((key, value){
      print('| ${value.universityId}\t |'
          '\t${value.details['name']} \t\t\t\t\t\t\t\t\t\t|');
      idList.add(value.universityId);
    });
    print('-------------------------------------------------------------');
    do{
      stdout.write('Enter id from given list: ');
      selectedId = stdin.readLineSync();
    }while(!idList.contains(selectedId));
    return selectedId;
  }

  /// method [_selectBranch] use to select branch Id from list
  String _selectBranch(String universityId){
    String selectedId;
    var idList = <String>[];
    print('-----------------------------LIST----------------------------');
    print('|     Id     |                   Name                       |');
    print('-------------------------------------------------------------');
    _universityList[universityId].details['branches'].forEach((key, value){
      print('| ${value.branchId}\t|'
          '\t${value.details['name']} \t\t\t\t\t\t\t\t\t\t|');
      idList.add(value.branchId);
    });
    print('-------------------------------------------------------------');
    do{
      stdout.write('Enter id from given list: ');
      selectedId = stdin.readLineSync();
    }while(!idList.contains(selectedId));
    return selectedId;
  }

  /// method [_selectCourse] use to select course Id from list
  String _selectCourse(String universityId){
    String selectedId;
    var idList = <String>[];
    print('-----------------------------LIST----------------------------');
    print('|     Id     |                   Name                       |');
    print('-------------------------------------------------------------');
    _universityList[universityId].details['courses'].forEach((key, value){
      print('| ${value.courseId}\t|'
          '\t${value.details['name']} \t\t\t\t\t\t\t\t\t\t|');
      idList.add(value.courseId);
    });
    print('-------------------------------------------------------------');
    do{
      stdout.write('Enter id from given list: ');
      selectedId = stdin.readLineSync();
    }while(!idList.contains(selectedId));
    return selectedId;
  }

  /// method [_enrolStudent] use to enrol student in list
  void _enrolStudent(Map<String, String> value){
    if(value['universityId'] == null){
      value['universityId'] = _selectUniversity();
    }
    if(value['branchId'] == null){
      value['branchId'] = _selectBranch(value['universityId']);
    }
    if(value['courseId'] == null){
      value['courseId'] = _selectCourse(value['universityId']);
    }
    var newStudent = Student(
        age: int.parse(value['age']),
        city: value['city'],
        country: value['country'],
        name: value['name'],
        phoneNo: value['phoneNo'],
        postalCode: value['postalCode'],
        email: value['email'],
        state: value['state'],
        street: value['street']);
    var avgMark = 0.0;
    avgMark ??= double.parse(value['avgMark']);
    var passedYear = 0;
    passedYear ??= int.parse(value['passedYear']);
    newStudent.enroll(
        universityId: value['universityId'],
        branchId: value['branchId'],
        courseId: value['courseId']);
    newStudent.update(
        highestEducation: value['highestEducation'],
        pastYears: passedYear);
    _enrolledPerson[newStudent.studentId] = newStudent;
    print('(1 student enrolled successfully)');
  }

  /// method [_enrolProfessor] use to enrol professor in list
  void _enrolProfessor(Map<String, String> value){
    if(value['universityId'] == null){
      value['universityId'] = _selectUniversity();
    }
    if(value['branchId'] == null){
      value['branchId'] = _selectBranch(value['universityId']);
    }
    if(value['courseId'] == null){
      value['courseId'] = _selectCourse(value['universityId']);
    }
    var age = 0;
    age ??= int.parse(value['age']);
    var experienceInYears = 0;
    experienceInYears ??= int.parse(value['experienceInYears']);
    var salary = 0.0;
    salary ??= double.parse(value['salary']);
    var newProfessor = Professor(
        age: age,
        city: value['city'],
        country: value['country'],
        email: value['email'],
        experienceInYears: experienceInYears,
        name: value['name'],
        postalCode: value['postalCode'],
        proficiency: value['proficiency'],
        phoneNo: value['phoneNo'],
        state: value['state'],
        street: value['street']);
    newProfessor.update(salary: salary);
    if(value['skills'] != null){
      List<String> skillsList;
      skillsList = value['skills'].split(',');
      newProfessor.updateSkills(operation: 'add', skills: skillsList);
    }
    _enrolledPerson[newProfessor.professorId] = newProfessor;
    print('(1 professor enrolled successfully)');
  }

  /// method [_groupByUniversity] use to print list group by university
  void _groupByUniversity(){
    print('-----------------------------LIST-----------------------------------'
        '---------');
    print('|     Id     |          Name                |   ROLE    |     '
        'UNIVERSITY    |');
    print('--------------------------------------------------------------------'
        '---------');
    var listToPrint = <String, dynamic>{};
    _enrolledPerson.forEach((key, value){
      if(listToPrint[value.details['universityId']] == null){
        listToPrint[value.details['universityId']] = [];
      }
      var dataToAddInList = {
        'role': value.details['role'],
        'name': value.details['name'],
      };
      if(dataToAddInList['role'] == 'STUDENT'){
        dataToAddInList['id'] = value.studentId;
      }else{
        dataToAddInList['id'] = value.professorId;
      }
      listToPrint[value.details['universityId']].add(dataToAddInList);
    });
    listToPrint.forEach((key, value){
      value.forEach((groupedList){
        print('| ${groupedList['id']} | ${groupedList['name']} \t\t\t|'
            ' ${groupedList['role']} \t| ${_universityList[key].details['name']}'
            '\t\t\t\t|');
      });
    });
    print('--------------------------------------------------------------------'
        '---------');
  }

  /// method [_groupByCity] use to print group list by city
  void _groupByCity(){
    print('-----------------------------LIST-----------------------------------'
        '---------');
    print('|     Id     |          Name                |   ROLE    |        '
        'CITY       |');
    print('--------------------------------------------------------------------'
        '---------');
    var listToPrint = <String, dynamic>{};
    _enrolledPerson.forEach((key, value){
      if(listToPrint[value.details['address']['city']] == null){
        listToPrint[value.details['address']['city']] = [];
      }
      var dataToAddInList = {
        'role': value.details['role'],
        'name': value.details['name'],
      };
      if(dataToAddInList['role'] == 'STUDENT'){
        dataToAddInList['id'] = value.studentId;
      }else{
        dataToAddInList['id'] = value.professorId;
      }
      listToPrint[value.details['address']['city']].add(dataToAddInList);
    });
    listToPrint.forEach((key, value){
      value.forEach((groupedList){
        print('| ${groupedList['id']} | ${groupedList['name']} \t\t\t|'
            ' ${groupedList['role']} \t| ${key}'
            '\t\t|');
      });
    });
    print('--------------------------------------------------------------------'
        '---------');
  }

  /// method [_resolveQuery] resolve the query entered by user
  void _resolveQuery(List<String> query){
    Map<String, String> queryToMap;
    if(query.length < 2){
      print(_query);
      print('^ -> invalid query');
      print('Use HELP or -H or --HELP for help');
      return;
    }
    try {
      queryToMap = _keyValueMap(query.sublist(2));
      print(queryToMap);
      if(query[0] == 'ENROL'){
        if(query[1] == 'STUDENT'){
          _enrolStudent(queryToMap);
        }else if(query[1] == 'PROFESSOR'){
          _enrolProfessor(queryToMap);
        }else{
          print(_query);
          print('      ^ -> invalid role option, use STUDENT/PROFESSOR only');
        }
      }
//      else if(query[0] == 'FILTER'){
//
//      }
      else if(query[0] == 'GROUP' && query[1] == 'BY'){
        print(queryToMap);
        if(queryToMap['university'] == '1'){
          _groupByUniversity();
        }else if(queryToMap['city'] == '1'){
          _groupByCity();
        }else{
          throw('invalid filter options');
        }
      }else{
        print(_query);
        print('^ -> invalid operations, use ENROL/FILTER/GROUP only');
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