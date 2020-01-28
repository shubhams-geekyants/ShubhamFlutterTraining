import 'dart:io';
import 'package:day_4_assignment/ascending_order.dart';

void main(List<String> arguments) {
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
}
