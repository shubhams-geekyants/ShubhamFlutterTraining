import 'package:meta/meta.dart';
import 'package:university_management/address.dart';

class Person extends Address{

  /*
  * _name store name of person
  * _phoneNo store phone number of person
  * _email store email or person
  * _role store role of person( NOROLE, STUDENT, PROFESSOR)
  */

  String _id, _name, _phoneNo, _email, _role;
  int _age;
  Person({
    @required int age,
    @required String city,
    @required String country,
    @required String email,
    @required String name,
    @required String postalCode,
    String phoneNo,
    @required String state,
    String street,
    @required String role
  }):super(
      city: city,
      country: country,
      postalCode: postalCode,
      state: state,
      street: street){
    if(age == null) throw('\'age\' is required');
    if(email == null) throw('\'email\' is required');
    if(name == null) throw('\'name\' is required');
    if(role == null) throw('\'role\' is required');
    _age = age;
    _id = hashCode.toString();
    _email = email;
    _name = name;
    _phoneNo = phoneNo;
    _role = role;
  }

  // getter method 'getDetail' return data
  @override
  Map get details{
    var dataToReturn = {
      'personId': _id,
      'name': _name,
      'email': _email,
      'role': _role,
      'age': _age,
      'address': super.details,
    };
    if(_phoneNo != null){
      dataToReturn['phoneNo'] = _phoneNo;
    }
    return dataToReturn;
  }

  // 'updateData' method update data
  @override
  void update({
    int age,
    String city,
    String country,
    String email,
    String name,
    String postalCode,
    String phoneNo,
    String state,
    String street
  }) {
    super.update(
        street: street,
        city: city,
        state: state,
        postalCode: postalCode,
        country: country);
    if(age != null){
      _age = age;
    }
    if(email != null){
      _email = email;
    }
    if(name != null){
      _name = name;
    }
    if(phoneNo != null){
      _phoneNo = phoneNo;
    }
  }

}