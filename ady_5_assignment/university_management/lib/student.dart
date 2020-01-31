import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:university_management/person.dart';

class Student extends Person{

  /*
  * _id store the unique id of student
  * _currentUniversityId store id of enrolled university
  * _currentBranchId store id of branch of enrolled university
  * _yearsInCourse store number of years in enrolled course
  * _pastYearsInCourse store number of year student passed or current year
  * _isEnrolled store student is enrolled or not
  * _isBlackListed store student is blacklisted or not
  * */

  String _id, _currentUniversityId, _currentBranchId;
  double _avgMark;
  int _yearsInCourse, _pastYearsInCourse;
  bool _isEnrolled, _isBlackListed;

  // constructor used for init the value of this and super class both,
  // and generating the id of student based on hashCode
  // this id is used for searching in database
  Student({
    @required int age,
    @required String city,
    @required String country,
    @required String email,
    @required String name,
    @required String postalCode,
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
      role: 'STUDENT',
  ){
    _avgMark = 0;
    _id = hashCode.toString();
    _isEnrolled = false;
    _isBlackListed = false;
    _yearsInCourse = 0;
    _pastYearsInCourse = 0;
  }

  // getter method 'getDetail' return data
  @override
  Map get details {
    var dataToReturn = super.details;
    dataToReturn['avgMark'] = _avgMark;
    dataToReturn['isBlackListed'] = _isBlackListed;
    dataToReturn['isEnrolled'] = _isEnrolled;
    if(_isEnrolled){
      dataToReturn['currentUniversityId'] = _currentUniversityId;
      dataToReturn['currentBranchId'] = _currentBranchId;
      dataToReturn['yearsInCourse'] = _yearsInCourse;
      dataToReturn['pastYearsInCourse'] = _pastYearsInCourse;
    }
    dataToReturn['studentId'] = _id;
    return dataToReturn;
  }

  @override
  void update({
    int age,
    double avgMark,
    bool blackListed,
    String branchId,
    String city,
    String country,
    String email,
    String name,
    int pastYears,
    String postalCode,
    String phoneNo,
    String state,
    String street,
    String universityId,
  }) {
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
    if( avgMark != null){
      _avgMark = avgMark;
    }
    if( blackListed != null){
      _isBlackListed = blackListed;
    }
    if(!_isEnrolled && (branchId != null || pastYears != null || universityId != null)){
      throw('Student not enrolled for any unversity');
    }else{
      if( branchId != null ){
        _currentBranchId = branchId;
      }
      if( pastYears != null ){
        _pastYearsInCourse = pastYears;
      }
      if( universityId != null){
        _currentUniversityId = universityId;
      }
    }
  }

}