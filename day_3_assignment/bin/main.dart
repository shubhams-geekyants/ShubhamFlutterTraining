import 'dart:io';
import 'dart:math';
import 'package:day_3_assignment/chocolates.dart';
import 'package:day_3_assignment/min_value_taxi.dart';
import 'package:day_3_assignment/tic_tac.dart';

void main(List<String> arguments) {
  
  int menu;
  print('Enter \n1 for Q1');
  print('2 for Q2');
  print('3 for Q3');
  print('4 for Q4');
  print('5 for Q5');
  menu = int.parse(stdin.readLineSync().toString());
  if(menu == 1){
    double distance;
    distance = double.parse(stdin.readLineSync());
    print(getTaxi(distance)?'Online':'Offline');
  }else if(menu == 2){
    var i = 1;
    var chocolateList = [];
    print('Enter no. of chocolates in P1: ');
    int temp; // temporary variable to store No. of chocolates in a packet
    temp = int.parse(stdin.readLineSync());
    chocolateList.add(temp);
    var test = 'N';
    print('Have more packets (Y/N)');
    test = stdin.readLineSync();
    while(test == 'Y' || test == 'y'){
      print('Enter no. of chocolates in P${++i}: ');
      temp = int.parse(stdin.readLineSync());
      chocolateList.add(temp);
      print('Have more packets (Y/N)');
      test = stdin.readLineSync();
    }
    for(var i = 0; i < chocolateList.length; i++){
      print('P${i+1}: ${buyOrNot(chocolateList[i])?'YES':'NO'}');
    }
  }else if(menu == 3){
    var random = Random();
    print(random.nextInt(2) == 0?'Head':'Tail');
  }else if(menu == 4){
    var game = TicTac();
    game.begin();
  }else if(menu == 5){
    var random = Random();
    var post  = {
      0: 'post 1',
      1: 'post 2',
      2: 'post 3',
      3: 'post 4',
      4: 'post 5',
      5: 'post 6',
      6: 'post 7',
      7: 'post 8',
      8: 'post 9',
      9: 'post 10'
    };
    var luckyNumber =  random.nextInt(10);
    print('Lucky Number: ${luckyNumber}, Post: ${post[luckyNumber]}');
  }else{
    print('Invalid optio :-( \nGood Bye  :-)');
  }
}
