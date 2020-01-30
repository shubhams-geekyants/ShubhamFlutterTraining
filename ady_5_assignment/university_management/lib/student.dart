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
  Student(String name, String email, [String phoneNo]) :
        super(name, email, phoneNo, 'STUDENT'){
    _id = hashCode as String;
  }

  @override
  // getter method to get student data
  Map get getDetail {
    var dataToReturn = super.getDetail;
    dataToReturn['avgMark'] = _avgMark;
    dataToReturn['currentUniversityId'] = _currentUniversityId;
    dataToReturn['currentBranchId'] = _currentBranchId;
    dataToReturn['isBlackListed'] = _isBlackListed;
    dataToReturn['isEnrolled'] = _isEnrolled;
    dataToReturn['pastYearsInCourse'] = _pastYearsInCourse;
    dataToReturn['studentId'] = _id;
    dataToReturn['yearsInCourse'] = _yearsInCourse;
    return dataToReturn;
  }

  @override
  void updateData([String name, String email, String phoneNo, String role,
  String currentUniversityId, String currentBranchId, ]) {
    super.updateData(name, email, phoneNo, role);

  }

}