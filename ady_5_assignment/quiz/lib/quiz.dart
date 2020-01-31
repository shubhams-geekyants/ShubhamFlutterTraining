import 'dart:io';
import 'dart:math';
class Quiz{

  Map countryCapitalList;
  int maxNoOfChances;
  Quiz(){
    countryCapitalList = {
      'Iceland': 'Reykjavik',
      'India': 'New Delhi',
      'Indonesia': 'Jakarta',
      'Macedonia': 'Skopje',
      'Madagascar': 'Antananarivo',
      'Malawi': 'Lilongwe',
      'Malaysia': 'Kuala Lumpur',
      'Maldives': 'Male',
      'Nepal': 'Kathmandu',
      'Namibia': 'Windhoek',
      'Seychelles': 'Victoria',
      'Sierra Leone': 'Freetown',
      'Singapore': 'Singapore',
      'Slovakia': 'Bratislava',
      'Slovenia': 'Ljubljana',
      'Solomon Islands': 'Honiara',
      'Somalia': 'Mogadishu',
    };
    maxNoOfChances = 3;
  }

  void begin() async {
    var isWinner = false;
    var random = Random();
    var newRandomNo = random.nextInt(15);
    do{
      var count = 0;
      String country;
      await countryCapitalList.forEach((key, value)=>{
        if(++count == newRandomNo){
          country = key
        }
      });
      stdout.write('Enter capital of ${country}: ');
      var capital = stdin.readLineSync();
      if(capital == countryCapitalList[country]){
        isWinner = true;
      }else{
        maxNoOfChances--;
        print('Wrong answer, you have ${maxNoOfChances} chance remaining');
      }
    }while(maxNoOfChances != 0 && !isWinner);
    if(isWinner){
      print('You win the match');
    }
    stdout.write('Your want to replay(Y/N)');
    var isReplaying = stdin.readLineSync().toLowerCase();
    if(isReplaying == 'y'){
      maxNoOfChances = 3;
      begin();
    }else{
      print('Good Bye :-)');
    }
  }
}
