import 'dart:io';
import 'package:University/university.dart';


void main(List<String> arguments) {
  int menu;
  var newUniversity = University('TestU', '123', 100, 100000);
  print('Choose menu:');
  print('''
  1. Print current open branches
  2. Location based
  3. Time based''');
  menu = int.parse(stdin.readLineSync());
  if(menu == 1){
   newUniversity.printOpenBranch(true, DateTime.now().toUtc());
  }else if(menu == 2){
    print('Enter location: ');
    var location = stdin.readLineSync();
    newUniversity.printOpenBranch(false, DateTime.now().toUtc(),location);
  }else{
    print('Enter time (HH:MM):');
    var dateTime = stdin.readLineSync();
    dateTime = '2000-01-01 ${dateTime}:00';
    newUniversity.printOpenBranch(true, DateTime.parse(dateTime).toUtc());
  }
}
