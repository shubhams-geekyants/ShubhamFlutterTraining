import 'dart:convert';
import 'package:university_management/student.dart';
import 'package:university_management/university.dart';


void main(List<String> arguments) {
    String prettyPrint;
    var newStudent = Student(
      age: 21,
      name: 'Shubham Srivastava',
      email: 'shubham9918sri@gmail.com',
      highestEducation: '12th',
      city: 'Greater Noida',
      country: 'India',
      postalCode: '272302',
      state: 'Uttar Pradesh',
    );
    print(newStudent.details);
    var newUniversity = University(
      city: 'Lucknow',
      country: 'India',
      email: 'abc@xyz.com',
      name: 'xyz',
      postalCode: '272302',
      state: 'Uttar Pradesh',
    );

}