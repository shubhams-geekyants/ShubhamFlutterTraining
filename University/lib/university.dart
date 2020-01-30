import 'dart:io';
import 'package:University/brance.dart';

class University{
  String name, code;
  int noOfColleges, noOfStudents;
  List<Branch> branches;
  University(String name, String code, int noOfColleges, int noOfStudents){
    this.name = name;
    this.code = code;
    this.noOfColleges = noOfColleges;
    this.noOfStudents = noOfStudents;
    branches = [
      Branch('test1', '123', 'xyz',
          DateTime.parse('2000-01-01 09:00:00').toUtc(),
          DateTime.parse('2000-01-01 17:00:00').toUtc()),
      Branch('test2', '133', 'abc',
          DateTime.parse('2000-01-01 09:00:00').toUtc(),
          DateTime.parse('2000-01-01 16:00:00').toUtc()),
      Branch('test3', '136', 'mno',
          DateTime.parse('2000-01-01 10:00:00').toUtc(),
          DateTime.parse('2000-01-01 16:00:00').toUtc()),
      Branch('test4', '231', 'xyz',
          DateTime.parse('2000-01-01 17:00:00').toUtc(),
          DateTime.parse('2000-01-01 23:00:00').toUtc()),
    ];
  }
  bool _isOpen(DateTime nowTime, DateTime openTime, DateTime closeTime){
    var nowSecond = nowTime.hour * 60 * 60 + nowTime.minute * 60 + nowTime.second;
    var openSecond = openTime.hour * 60 * 60 + openTime.minute * 60 + openTime.second;
    var closeSecond = nowTime.hour * 60 * 60 + openTime.minute * 60 + openTime.second;
    if( nowSecond >= openSecond && nowSecond <= closeSecond){
      return true;
    }else{
      return false;
    }
  }
  void printOpenBranch(bool anyLocation, DateTime nowTime,[String location]){
    for(var num = 0; num < branches.length; num++){
      if(anyLocation){
        if(_isOpen(nowTime, branches[num].openTime,branches[num].closeTime)){
          var openTime = branches[num].openTime.toLocal();
          var closeTime = branches[num].closeTime.toLocal();
          stdout.write('Branch Name: ${branches[num].name}\t');
          stdout.write('Id: ${branches[num].code}\t');
          stdout.write('Location: ${branches[num].location}\t');
          stdout.write('Close Time(HH:MM): ${openTime.hour}:${openTime.minute}\t');
          stdout.write('Open Time(HH:MM): ${closeTime.hour}:${closeTime.minute}\n');
        }
      }else{
        if(location == branches[num].location &&
            _isOpen(nowTime, branches[num].openTime,
                branches[num].closeTime)){
          var openTime = branches[num].openTime.toLocal();
          var closeTime = branches[num].closeTime.toLocal();
          stdout.write('Branch Name: ${branches[num].name}\t');
          stdout.write('Id: ${branches[num].code}\t');
          stdout.write('Location: ${branches[num].location}\t');
          stdout.write('Close Time(HH:MM): ${openTime.hour}:${openTime.minute}\t');
          stdout.write('Open Time(HH:MM): ${closeTime.hour}:${closeTime.minute}\n');
        }
      }
    }
  }
}