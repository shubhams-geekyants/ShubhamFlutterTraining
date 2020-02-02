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

  String _currentUniversityId, _currentBranchId, _proficiency, _id;
  double _salary;
  bool _isEmployee;
  Set<String> _skills;
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
    _skills = <String>{};
    _experienceInYears = experienceInYears;
  }

  // getter method 'detail' return data
  @override
  Map get details {
    var dataToReturn = super.details;
    dataToReturn['experienceInYears'] = _experienceInYears;
    dataToReturn['skills'] = _skills;
    dataToReturn['professorId'] = _id;
    dataToReturn['proficiency'] = _proficiency;
    if(_isEmployee){
      dataToReturn['universityId']=_currentUniversityId;
      dataToReturn['branchId'] = _currentBranchId;
      dataToReturn['salary'] = _salary;
    }
    return dataToReturn;
  }

  // method 'update' update data
  @override
  void update({
    int age,
    String city,
    String country,
    String email,
    int experienceInYears,
    String name,
    String phoneNo,
    String postalCode,
    String proficiency,
    double salary,
    String state,
    String street}) {
    super.update(
        age: age,
        city: city,
        country: country,
        email: email,
        name: name,
        postalCode: postalCode,
        phoneNo: phoneNo,
        state: state,
        street: street);
    _experienceInYears ??= experienceInYears;
    _proficiency ??= proficiency;
    _salary ??= salary;
  }

  // some util function to update skills
  set _addSkill(String skill){
    _skills.add(skill);
  }
  set _addSkills(List<String> skills){
    skills.forEach((value) => _skills.add(value));
  }
  set _removeSkill(String skill){
    _skills.remove(skill);
  }
  set _removeSkills(List<String> skills){
    _skills.removeAll(skills);
  }

  // method 'updateSkills' update skills
  // parameters
  //  1. operation -> what operation to perform on _skills list.
  //                  Operations are ADD, REMOVE
  //  2. skill/skills -> list or string of skill
  void updateSkills({@required String operation, String skill, List<String> skills}){
    operation = operation.toUpperCase();
    if(skills != null && skill != null) {
      throw('Only one prameter \'skill\' '
        'or \'skills\' is allowed');
    }
    if(skills == null && skill == null) {
      throw('One prameter \'skill\' '
          'or \'skills\' is required');
    }
    switch(operation){
      case 'ADD':
        if(skill  != null){
          _addSkill = skill;
        }else{
          _addSkills = skills;
        }
        break;
      case 'REMOVE':
        if(skill  != null){
          _removeSkill = skill;
        }else{
          _removeSkills = skills;
        }
        break;
      default: throw('Invalid operation ${operation}. '
          'Only ADD, REMOVE operation are allowed');
    }
  }
}