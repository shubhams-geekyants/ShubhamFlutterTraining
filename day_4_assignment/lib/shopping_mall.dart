import 'dart:io';

class ShoppingMall{
  List<int> _queueList;
  int _maxNoOfPersonInQueue, _noOfQueue;
  ShoppingMall(int noOfQueue, int maxNoOfPersonInQueue){
    int temp; // temporary variable
    _maxNoOfPersonInQueue = maxNoOfPersonInQueue;
    _noOfQueue = noOfQueue;
    _queueList = <int>[].toList();
    print('Enter the inital number of person on each counter:');
    for(var num = 0; num < _noOfQueue; num++){
      stdout.write('On couner ${num+1}:');
      temp = int.parse(stdin.readLineSync());
      if(temp > _maxNoOfPersonInQueue){
        num--;
        print('Not posible value, please enter between 0 to ${_maxNoOfPersonInQueue} 🙄');
      }else{
        _queueList.add(temp);
      }
    }
  }
  void printMenu(){
    print('''Enter what you want:
     1. Display number of person on each counter
     2. Add new person
     3. Remove person from counter
     4. Quit
    ''');
    stdout.write('Enter here: ');
  }
  void addNewPerson(){
    var index = 0;
    var min = _queueList[0];
    for(var num = 1; num < _noOfQueue; num++){
      if(min > _queueList[num]){
        index = num;
        min = _queueList[index];
      }
    }
    if(min == _maxNoOfPersonInQueue){
      print('All queues are full, please wait for minuts 😔');
      return;
    }else{
      _queueList[index]++;
      print('Person is sucessfully added to queue number ${index+1} 😃');
      return;
    }
  }
  void removePerson(int queueNumber){
    if(_queueList[queueNumber - 1] == 0){
      print('Queue is allready empty 🙄');
    }else{
      _queueList[queueNumber - 1]--;
      print('Person is succesfully removed 😁');
    }
  }
  void begin(){
    var menu = 0;
    while(menu != 4){
      printMenu();
      menu = int.parse(stdin.readLineSync());
      if(menu == 1){
        print('Person on each counter:');
        for(var num = 0; num < _noOfQueue; num++){
          stdout.write('${_queueList[num]}\t');
        }
        print('');
      }else if(menu == 2){
        addNewPerson();
      }else if(menu == 3){
        int queueNumber;
        stdout.write('Enter from which row person to remove: ');
        queueNumber = int.parse(stdin.readLineSync());
        if(queueNumber > _noOfQueue){
          print('Not posible value, please enter between 1 to ${_noOfQueue} 🙄');
        }else{
          removePerson(queueNumber);
        }
      }else if(menu == 4){
        print('Good Bye 👋😀');
      }else{
        print('Choose correct option 😇');
      }
    }
  }
}