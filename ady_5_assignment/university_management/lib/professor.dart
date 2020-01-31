import 'package:meta/meta.dart';
import 'package:university_management/person.dart';

class Professor extends Person{
  /*
  * _currentUniversityId store current working university
  * _currentBranch store current working branch
  * _proficiency store proficiency of professor
  * _skills is list use to store skill of professor
  * _isEmployee store professor is working or not
  * _salary store the salary of professor
  * _id store professor ID
  * */

  String _currentUniversityId, _currentBranch, _proficiency, _id;
  double _salary;
  bool _isEmployee;
  List<String> _skills;
  int _experienceInYears;

  Professor({
    @required int age,
    @required String city,
    @required String country,
    @required String email,
    int experienceInYears = 0,
    @required String name,
    @required String postalCode,
    String proficiency,
    String phoneNo,
    @required String state,
    String street,
  }):super(
    age: age,
    city: city,
    country: country,
    email: email,
    name: name,
    postalCode: postalCode,
    phoneNo: phoneNo,
    state: state,
    street: street,
    role: 'PROFESSOR',
  ){
    if(proficiency == null) throw('\'proficiency\' is reqiured');
    _id = hashCode.toString();
    _isEmployee = false;
    _proficiency = proficiency;
    _salary = 0;
    _skills = <String>[].toList();
    _experienceInYears = experienceInYears;
  }

}