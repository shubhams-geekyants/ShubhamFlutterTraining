import 'dart:io';

import 'dart:math';

class Billing{
  var _pricePerUnitInUSD = {};
  var _currencyRatio = {};
  var _itemPurchasedQuantity = {};
  var _name, _mobileNo;
  var _country = '';
  Billing() {
    _currencyRatio = {
      'india': [71.22, '₹'],
      'japan': [109.16, '円'],
      'russia': [62.40, '₽'],
      'china': [6.94, '¥'],
      'usa': [1, '\$']
    };
    _pricePerUnitInUSD = {
      'A1': 3.60,
      'A2': 4.43,
      'B1': 5.76,
      'B2': 2.67,
      'C1': 9.19,
      'C2': 5.34
    };
    _country = 'usa';
    _itemPurchasedQuantity = {};
  }
  void printMenu(){
    print('''Enter what you want:
     1. Display current bill
     2. Add new item to cart
     3. Update item in cart
     4. Remove item from cart
     5. Done, final bill''');
    stdout.write('Enter here: ');
  }
  void displayBill(){
    var total = 0.0;
    var temp = 0.0;
    void callback(dynamic k, dynamic v){
      temp = v * _pricePerUnitInUSD[k] * _currencyRatio[_country][0];
      temp = double.parse(temp.toStringAsFixed(2));
      total += temp;
      total = double.parse(total.toStringAsFixed(2));
      print('${k}\t\t${v}\t\t${temp}${_currencyRatio[_country][1]}');
    }
    print('Item\tQty.\tAmount');
    print('--------------------------');
    _itemPurchasedQuantity.forEach(callback);
    print('--------------------------');
    print('Total\t\t\t${total}${_currencyRatio[_country][1]}');
  }
  void addItem(){
    stdout.write('What you want to add ( ');
    _pricePerUnitInUSD.forEach((k,v)=>stdout.write('${k} '));
    stdout.write(')\nEnter here: ');
    var item = stdin.readLineSync().toUpperCase();
    stdout.write('Enter quantity: ');
    var quantity = int.parse(stdin.readLineSync());
    if(_itemPurchasedQuantity[item] != null){
      print('Item allready in cart 🙄');
      stdout.write('Are you want ot add more (Y/N): ');
      var wantToAdd = stdin.readLineSync().toLowerCase();
      if(wantToAdd == 'y'){
        _itemPurchasedQuantity[item] += quantity;
        print('Item added to cart 😀');
      }
    }else if(_pricePerUnitInUSD[item] != null){
      _itemPurchasedQuantity[item]=quantity;
      print('Item added to cart 😀');
    }else{
      print('Item not found 🙄');
    }
  }
  void updateCart(){
    stdout.write('What you want to update ( ');
    _itemPurchasedQuantity.forEach((k,v)=>stdout.write('${k} '));
    stdout.write(') \nEnter here: ');
    var item = stdin.readLineSync().toUpperCase();
    stdout.write('Enter new quantity: ');
    var quantity = int.parse(stdin.readLineSync());
    if( _itemPurchasedQuantity[item] != null){
      _itemPurchasedQuantity[item] = quantity;
      print('Item updated in cart 😀');
    }else{
      print('Item not found 🙄');
    }
  }
  void removeItem(){
    stdout.write('What you want to remove ( ');
    _itemPurchasedQuantity.forEach((k,v)=>stdout.write('${k} '));
    stdout.write(') \nEnter here: ');
    var item = stdin.readLineSync().toUpperCase();
    if( _itemPurchasedQuantity[item] != null){
      _itemPurchasedQuantity.remove(item);
      print('Item removed from cart 😀');
    }else{
    print('Item not found 🙄');
    }
  }
  void done(){
    if(_itemPurchasedQuantity.isNotEmpty){
      stdout.write('Enter name: ');
      _name = stdin.readLineSync().toUpperCase();
      stdout.write('Enter contact No.: ');
      _mobileNo = stdin.readLineSync().toLowerCase();
      print('----------Bill------------');
      print('Name: ${_name}');
      print('Contact No: ${_mobileNo}');
      displayBill();
      print('--------Thank You---------');
    }
  }
  void begin(){
    var menu = 0;
    stdout.write('Choose country ( ');
    _currencyRatio.forEach((k,v)=>stdout.write('${k.toString().toUpperCase()} '));
    stdout.write(')\nEnter here: ');
    var country = stdin.readLineSync().toLowerCase();
    if(_currencyRatio[country] != null){
      _country = country;
    }
    while(menu != 5){
      printMenu();
      menu = int.parse(stdin.readLineSync());
      if(menu == 1){
        if(_itemPurchasedQuantity.isNotEmpty){
          print('----------Bill------------');
          displayBill();
          print('--------Thank You---------');
        }else{
          print('Cart is empty 🙄');
        }
      }else if(menu == 2){
        addItem();
      }else if(menu == 3) {
        if(_itemPurchasedQuantity.isNotEmpty){
          updateCart();
        }else{
          print('Cart is empty 🙄');
        }
      }else if(menu == 4){
        if(_itemPurchasedQuantity.isNotEmpty){
          removeItem();
        }else{
          print('Cart is empty 🙄');
        }
      }else if(menu == 5){
        done();
        print('Good Bye 👋😀');
      }else{
        print('Choose correct option 😇');
      }
    }
  }
}