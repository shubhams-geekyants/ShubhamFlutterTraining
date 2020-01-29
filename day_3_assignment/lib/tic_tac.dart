import 'dart:io';

class TicTac{
  var state = [];
  var userChance = 1;
  TicTac(){
    for(var i = 0; i < 3; i++){
      state.add([0,0,0]);
    }
  }
  bool testWin(int user){
    var l1 = state[0][0] == user && state[0][1] == user && state[0][2] == user;
    var l2 = state[1][0] == user && state[1][1] == user && state[1][2] == user;
    var l3 = state[2][0] == user && state[2][1] == user && state[2][2] == user;
    var l4 = state[0][0] == user && state[1][0] == user && state[2][0] == user;
    var l5 = state[1][0] == user && state[1][1] == user && state[1][2] == user;
    var l6 = state[2][0] == user && state[2][1] == user && state[2][2] == user;
    var l7 = state[0][0] == user && state[1][1] == user && state[2][2] == user;
    var l8 = state[2][0] == user && state[1][1] == user && state[0][2] == user;
    if(l1||l2||l3||l4||l5||l6||l7||l8){
      return true;
    } else{
      return false;
    }
  }
  bool setPosition(int user, int x, int y){
    if(x >= 3 || y >= 3){
      return false;
    }else{
      if(state[x][y] == 0){
        state[x][y] = user;
        return true;
      }else{
        return false;
      }
    }
  }
  bool haveEmptyPos(){
    for(var i = 0; i < 3; i++){
      for(var j = 0; j < 3; j++){
        if(state[i][j] == 0){
          return true;
        }
      }
    }
    return false;
  }
  void printTicTac(){
    print('-----');
    for(var i = 0; i < 3; i++){
      print('${(state[i][0] == 0)?' ':(state[i][0] == 1?'*':'o')}|${(state[i][1] == 0)?' '
          :(state[i][1] == 1?'*':'o')}|${(state[i][2] == 0)?' ':(state[i][2] == 1?'*':'o')}');
      print('-----');
    }
  }
  void begin(){
    while(haveEmptyPos() && !testWin(1) && !testWin(2)){
      printTicTac();
      print('Enter position for user ${userChance}:');
      stdout.write('X: ');
      var x = int.parse(stdin.readLineSync());
      stdout.write('Y: ');
      var y = int.parse(stdin.readLineSync());
      var set = setPosition(userChance, x-1, y-1);
      while(!set){
        print('Position not allowed:-(\nPlease enter again:');
        stdout.write('X: ');
        x = int.parse(stdin.readLineSync());
        stdout.write('Y: ');
        y = int.parse(stdin.readLineSync());
        set = setPosition(userChance, x-1, y-1);
      }
      if(testWin(userChance)){
        print('User ${userChance} is winner');
        return;
      }
      userChance = userChance == 1?2:1;
    }
    print('No one can win :-|');
    return;
  }
}