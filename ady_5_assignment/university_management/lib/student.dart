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

  String _id, _currentUniversityId, _currentBranchId, _currentCourseId;
  String _highestEducation;
  double _avgMark;
  int _pastYearsInCourse;
  bool _isEnrolled, _isBlackListed;

  // constructor used for init the value of this and super class both,
  // and generating the id of student based on hashCode
  // this id is used for searching in database
  Student({
    @required int age,
    @required String city,
    @required String country,
    @required String email,
    @required String highestEducation,
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
    if(highestEducation == null) throw('\'highestEducation\' is required');
    _avgMark = 0;
    _highestEducation = highestEducation;
    _id = hashCode.toString();
    _isEnrolled = false;
    _isBlackListed = false;
    _pastYearsInCourse = 0;
  }

  // getter method 'details' return data
  @override
  Map get details {
    var dataToReturn = super.details;
    dataToReturn['avgMark'] = _avgMark;
    dataToReturn['highestEducation'] = _highestEducation;
    dataToReturn['isBlackListed'] = _isBlackListed;
    dataToReturn['isEnrolled'] = _isEnrolled;
    if(_isEnrolled){
      dataToReturn['currentUniversityId'] = _currentUniversityId;
      dataToReturn['currentBranchId'] = _currentBranchId;
      dataToReturn['pastYearsInCourse'] = _pastYearsInCourse;
      dataToReturn['courseId'] = _currentCourseId;
    }
    dataToReturn['studentId'] = _id;
    return dataToReturn;
  }

  // Method 'update' to update student details
  @override
  void update({
    int age,
    double avgMark,
    bool blackListed,
    String branchId,
    String city,
    String country,
    String courseId,
    String email,
    String highestEducation,
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
    _avgMark ??= avgMark;
    _highestEducation ??= highestEducation;
    _isBlackListed ??= blackListed;
    if(!_isEnrolled && (branchId != null || pastYears != null || universityId != null)){
      throw('Student not enrolled for any unversity');
    }else{
        _currentBranchId ??= branchId;
        _pastYearsInCourse ??= pastYears;
        _currentUniversityId ??= universityId;
        _currentCourseId ??= courseId;
    }
  }
}