import 'package:testapp/Product.dart';
import 'package:testapp/RegistrationForm.dart';
import 'package:testapp/toUpperCase.dart';
import 'dart:io';
import 'package:testapp/printTable.dart';
import 'package:testapp/maxFirst.dart';

void main(List<String> arguments) {
  int m;
  print('Enter \n1 for Q1');
  print('2 for Q2');
  print('3 for Q3');
  print('4 for Q4');
  print('5 for Q5');
  m = int.parse(stdin.readLineSync().toString());
  if(m == 1){
    var newProduct = Product('Test', true, 20000, 10);
    newProduct.printProduct();
  }else if(m == 2){
    String fullName, email, phoneNo;
    int age;
    print('Enter Name');
    fullName = stdin.readLineSync().toString();
    print('Enter Email');
    email = stdin.readLineSync().toString();
    print('Enter Phone No.');
    phoneNo = stdin.readLineSync().toString();
    print('Enter Age');
    age = int.parse(stdin.readLineSync());
    var newUser = RegistrationForm(fullName, email, phoneNo, age);
    newUser.printDetail();
  }else if(m == 3){
    String input;
    input = stdin.readLineSync().toString();
    print(toUpperCase(input));
  }else if(m == 4){
    int number;
    print('Enter Number: ');
    number = int.parse(stdin.readLineSync());
    printTable(number);
  }else if(m == 5){
    print(getMaxFirst(3478564376));
  }else{
    print('Invalid optio :-( \nGood Bye  :-)');
  }
}