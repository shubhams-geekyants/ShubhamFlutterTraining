import 'package:meta/meta.dart';
import 'package:university_management/address.dart';
import 'package:university_management/branch.dart';
import 'package:university_management/course.dart';

class University extends Address{

  /// [_id] store university id
  /// [_name] store name of university
  /// [_email] store email of university
  /// [_phoneNo] store phone number of university

  String _id, _name, _phoneNo, _email;
  Map<String, Branch> _branches;
  Map<String, Course> _courses;

  University({
    @required String city,
    @required String country,
    @required String email,
    @required String name,
    String phoneNo,
    @required String postalCode,
    @required String state,
    String street,
  }): super(
    city: city,
    country: country,
    postalCode: postalCode,
    state: state,
    street: street
  ){
    if(email == null) throw('\'email\' is required');
    if(name == null) throw('\'name\' is required');

    _id = hashCode.toString();
    _email ??= email;
    _name ??= name;
    _phoneNo ??= phoneNo;
    _branches = <String, Branch>{};
    _courses = <String, Course>{};
  }

  /// [details] method return university details
  @override
  Map get details {
    var address = super.details;
    var dataToReturn = {
      'unversityId': _id,
      'name': _name,
      'email': _email,
      'branches': _branches,
      'cources': _courses,
      'address': address
    };
    if( _phoneNo != null ) dataToReturn['phoneNo'] = _phoneNo;
    return dataToReturn;
  }

  /// method [universityId] return [_id]
  String get universityId => _id;

  /// method [_addCourse] can add new course to university
  set _addCourse(Map<String , dynamic> courseDetail) {
    var newCourse = Course(
        name: courseDetail['name'],
        duration: courseDetail['duration']);
    _courses[newCourse.courseId] = newCourse;
  }

  /// method [_addCourses] can add new courses to university
  set _addCourses(List<Map<String, dynamic>> courseList) =>
      courseList.forEach((value) => _addCourse = value);

  /// method [_addBranch] can add new course to university
  set _addBranch(Map<String , dynamic> branchDetail) {
    var newBranch = Branch(
      city: branchDetail['city'],
      country: branchDetail['country'],
      name: branchDetail['name'],
      postalCode: branchDetail['postalCode'],
      state: branchDetail['state'],
      street: branchDetail['street']
    );
    _branches[newBranch.branchId] = newBranch;
  }

  /// method [_addBranches] can add new branches to university
  set _addBranches(List<Map<String, dynamic>> branchList) =>
      branchList.forEach((value) => _addBranch = value);

  /// method [_filterBranch] return filtered list of branch by id, name or city
  Map<String, Branch> _filterBranch(Map<String, String> filter){
    Map<String, Branch> dataToReturn;
    dataToReturn = Map.from(_branches);
    dataToReturn.removeWhere((key, value){
      var isToFilter = true;
      if(filter['id'] != null && filter['id'] == value.branchId){
        isToFilter = false;
      }
      if(filter['name'] != null && filter['name'] == value.details['name']
          && isToFilter){
        isToFilter = false;
      }
      if(filter['city'] != null && filter['city'] == value.details['city']
          && isToFilter){
        isToFilter = false;
      }
      return isToFilter;
    });
    return dataToReturn;
  }

  /// method [_removeBranches] remove branches from university by [_id] list
  void _removeBranches({String id, List<String> ids}){
    if(id != null) {
      return _branches.removeWhere((key, value)=> value.branchId == id);
    }
    return _branches.removeWhere((key, value)=>ids.contains(value.branchId));
  }

  /// method [_filterCourse] return filtered list of course by id, name
  Map<String, Course> _filterCourse(Map<String, String> filter){
    Map<String, Course> dataToReturn;
    dataToReturn = Map.from(_courses);
    dataToReturn.removeWhere((key, value){
      var isToFilter = true;
      if(filter['id'] != null && filter['id'] == value.courseId){
        isToFilter = false;
      }
      if(filter['name'] != null && filter['name'] == value.details['name']
          && isToFilter){
        isToFilter = false;
      }
      return isToFilter;
    });
    return dataToReturn;
  }

  /// method [_removeCourses] remove courses by id or ids
  void _removeCourses({String id, List<String> ids}){
    if(id != null) {
      return _courses.removeWhere((key, value)=> value.courseId == id);
    }
    return _courses.removeWhere((key, value)=>ids.contains(value.courseId));
  }

  /// method [operations] perform operation in university
  /// OPERATIONS list
  /// 1. FIND : Find branches and courses  by name, id or location
  /// 2. ADD : Add branches and courses in university
  /// 3. REMOVE: Remove branches and course from university
  /// PARAMETERS list
  /// 1. [operation] is of String type
  /// VALUES: (ADD/FIND/REMOVE):(ONE/MANY):(BRANCH/COURSE)
  /// 2. [value] is of Map<String,dynamic> type
  /// VALUES: [Branch._id], [Branch], [Course._id], [Course], [List<Branch>]
  /// or [List<Course>]
  /// Note: FIND:ONE:BRANCH can require only one parameter [value.id]

  dynamic operations({String operation, dynamic value}){
    var splitOperation = operation.toUpperCase().split(':');
    if(splitOperation.length == 3){
      if(splitOperation[1] == 'ONE'){
        switch(splitOperation[2]){
          case 'BRANCH':
            switch(splitOperation[0]){
              case 'ADD':
                return _addBranch = value;
              case 'FIND':
                if(value['id'] == null) throw(''''id' is required paramter''');
                return _filterBranch({'id':value['id']});
              case 'REMOVE':
                if(value['id'] ==null) throw(''''id' is required''');
                return _removeBranches(id: value['id']);
              default: throw('''pass valid value to 'operation' parameter.''');
            }
            break;
          case 'COURSE':
            switch(splitOperation[0]){
              case 'ADD':
                return _addCourse = value;
              case 'FIND':
                if(value['id'] == null) throw(''''id' is required paramter''');
                return _filterCourse({'id': value['id']});
              case 'REMOVE':
                return _removeCourses(id: value['id']);
              default: throw('''pass valid value to 'operation' parameter.''');
            }
            break;
          default: break;
        }
      }else if(splitOperation[1] == 'MANY'){
        switch(splitOperation[2]){
          case 'BRANCH':
            switch(splitOperation[0]){
              case 'ADD':
                return _addBranches = value;
              case 'FIND':
                return _filterBranch(value);
              case 'REMOVE':
                if(value['ids'] == null) throw(''''ids' is required paramter''');
                return _removeBranches(ids: value['ids']);
              default: throw('''pass valid value to 'operation' parameter.''');
            }
            break;
          case 'COURSE':
            switch(splitOperation[0]){
              case 'ADD':
                return _addCourses = value;
              case 'FIND':
                return _filterCourse(value);
              case 'REMOVE':
                if(value['ids'] == null) throw(''''ids' is required paramter''');
                return _removeCourses(ids: value['ids']);
              default: throw('''pass valid value to 'operation' parameter.''');
            }
            break;
          default: break;
        }
      }else{
        throw('''pass valid value to 'operation' parameter.''');
      }
    }else{
      throw('''pass valid value to 'operation' parameter.''');
    }
  }


  // [update] method can update university details
  @override
  void update({
    String city,
    String country,
    String name,
    String email,
    String phoneNo,
    String postalCode,
    String state,
    String street}) {
    super.update(
        street: street,
        city: city,
        state: state,
        postalCode:
        postalCode,
        country: country);
    _name ??= name;
    _email ??= email;
    _phoneNo ??= phoneNo;
  }
}