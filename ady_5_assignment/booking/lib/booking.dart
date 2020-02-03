import 'package:booking/address.dart';
import 'package:booking/airline.dart';
import 'package:booking/bus.dart';
import 'package:booking/railway.dart';

class Booking extends Address implements Airline, Bus, Railway{
  Booking({
    String city,
    String country,
    String postalCode,
    String state,
    String street}) : super(
      city: city,
      country: country,
      postalCode: postalCode,
      state: state,
      street: street);

  static int available(String type){
    switch(type){
      case 'AIRLINE':
        return Airline.available;
      case 'BUS':
        return Bus.available;
      case 'RAILWAY':
        return Railway.available;
      default: throw('\'type\' parameter value must be AIRLINE/BUS/RAILWAY');
    }
  }

  static bool book(String type){
    switch(type){
      case 'AIRLINE':
        if(Airline.book()){
          return true;
        }
        return false;
      case 'BUS':
        if(Bus.book()){
          return true;
        }
        return false;
      case 'RAILWAY':
        if(Railway.book()){
          return true;
        }
        return false;
      default: throw('\'type\' parameter value must be AIRLINE/BUS/RAILWAY');
    }
  }
}