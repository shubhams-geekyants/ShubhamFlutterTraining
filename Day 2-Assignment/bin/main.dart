import 'dart:io';
import 'package:testapp/Product.dart';
import 'package:testapp/RegistrationForm.dart';
import 'package:testapp/toUpperCase.dart';
import 'package:testapp/printTable.dart';
import 'package:testapp/maxFirst.dart';
import 'package:testapp/nandniMilkParlour.dart';

void main(List<String> arguments) {
  int m;
  print('Enter \n1 for Q1');
  print('2 for Q2');
  print('3 for Q3');
  print('4 for Q4');
  print('5 for Q5');
  print('6 for Q6');
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
   }else if(m == 6){
     int x;
     print('Enter number of classes of milk:-');
     x = int.parse(stdin.readLineSync());
     var milkList = [];
     print('Enter each class quantity');
    for(var i = 0; i < x; i++){
      var temp;
      temp = int.parse(stdin.readLineSync());
      milkList.add(temp);
    }
    var newList = List.from(milkList);
    print('Enter required ammount:- ');
    var requiredMilk = int.parse(stdin.readLineSync());
    dynamic bill = getBill(requiredMilk, newList);
    if(bill.length > 0){
      print('Thank you, your order for 150 milk packets are accepted');
      print('Class\tTotal\tBilled\tRem.');
      for(var i = 0; i < milkList.length; i++){
        print('${i+1}\t${milkList[i]}\t${bill[milkList[i]]}\t${milkList[i] - bill[milkList[i]]}');
      }
    }else{
      print('Cannot deliver');
    }
  }else{
    print('Invalid optio :-( \nGood Bye  :-)');
  }
}