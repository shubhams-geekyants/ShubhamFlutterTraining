import 'dart:io';
import 'package:day_4_assignment/ascending_order.dart';
import 'package:day_4_assignment/billing.dart';
import 'package:day_4_assignment/shopping_mall.dart';

void main(List<String> arguments) {
  int m;
  print('Enter \n1 for Q1');
  print('2 for Q2');
  print('3 for Q3');
  m = int.parse(stdin.readLineSync().toString());
  if(m == 1){
    int numberOfElement, temp; // temporary variable
    var unsortedList = <int>[].toList();
    numberOfElement = int.parse(stdin.readLineSync());
    for(var num = 0; num < numberOfElement; num++){
      temp = int.parse(stdin.readLineSync());
      unsortedList.add(temp);
    }
    var ascendingOrder = AssecndingOrder(unsortedList);
    var sortedList = ascendingOrder.getSortedList();
    for(var num = 0; num < numberOfElement; num++){
      stdout.write('${sortedList[num]}');
      if(num != numberOfElement - 1){
        stdout.write(', ');
      }
    }
    print('');
  }else if(m == 2){
    var billingSystem = Billing();
    billingSystem.begin();
  }else if(m == 3){
    int noOfCounters, maxNoOfPersonPerCounter;
    stdout.write('Enter No. of counters: ');
    noOfCounters = int.parse(stdin.readLineSync());
    stdout.write('Enter No. of Customer per counter: ');
    maxNoOfPersonPerCounter = int.parse(stdin.readLineSync());
    var shoppingMall = ShoppingMall(noOfCounters, maxNoOfPersonPerCounter);
    shoppingMall.begin();
  }else{
    print('Invalid optio :-( \nGood Bye  :-)');
  }
}
