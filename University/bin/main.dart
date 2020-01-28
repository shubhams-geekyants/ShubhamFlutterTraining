import 'package:University/brance.dart';
import 'package:University/course.dart';
import 'package:University/student.dart';
import 'package:University/university.dart';


void main(List<String> arguments) {
  var newUniversity = University('TestU', '123', 100, 100000);
  var newCourse = Course('TestC','213',4);
  var newBranch = Branch('TestB','234','Tetsstshs Kjdh');
  var newStudent = Student('TestS','8e7y878347','91793734748', 'shuabhshj@shdh.com');
  print(newUniversity.name);
  print(newBranch.name);
  print(newCourse.name);
  print(newStudent.name);
}
