import 'package:day_3_assignment/chocolates.dart';
import 'package:day_3_assignment/minValueTaxi.dart';
import 'dart:io';
import 'dart:math';
void main(List<String> arguments) {
  
  int m;
  print('Enter \n1 for Q1');
  print('2 for Q2');
  print('3 for Q3');
  print('4 for Q4');
  print('5 for Q5');
  m = int.parse(stdin.readLineSync().toString());
  if(m == 1){
    double distance;
    distance = double.parse(stdin.readLineSync());
    print(getTaxi(distance)?'Online':'Offline');
  }else if(m == 2){
    var i = 1;
    var chocolateList = [];
    print('Enter no. of chocolates in P1: ');
    int temp;
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
  }else if(m == 3){
    var random = Random();
    print(random.nextInt(2) == 0?'Head':'Tail');
  }else if(m == 4){
    
  }else if(m == 5){
    var random = Random();
    var post  = {
      1: 'p1',
      2: 'p2',
      3: 'p3',
      4: 'p4',
      5: 'p5',
      6: 'p6',
      7: 'p7',
      8: 'p8',
      9: 'p9',
      10: 'p10'
    };
    var luckyNumber =  random.nextInt(11);
    print('Lucky Number: ${luckyNumber}, Post: ${post[luckyNumber]}');
  }else{
    print('Invalid optio :-( \nGood Bye  :-)');
  }
}
