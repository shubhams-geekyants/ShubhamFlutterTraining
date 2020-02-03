import 'package:meta/meta.dart';

class Course{
  /*
  * _id store course id
  * _name store name of course
  * _durationsInYears store duration of course in years
   */

  String _id, _name;
  int _durationInYears;

  // constructor with 'name' and 'duration' as required parameters
  Course({
    @required String name,
    @required int duration
  }){
    if(name == null) throw('\'name\' is required');
    if(duration == null) throw('\'duration\' is required');

    _id = hashCode.toString();
    _name = name;
    _durationInYears = duration;
  }

  // some getter methods as utils
  String get courseId => _id;

  // getter method 'details' return data
  Map get details{
    var dataToReturn = {
      'courseId': _id,
      'name': _name,
      'duration': _durationInYears
    };
    return dataToReturn;
  }

  // method 'update' update course details
  void update({String name, int duration}) {
    _name ??= name;
    _durationInYears ??= duration;
  }
}