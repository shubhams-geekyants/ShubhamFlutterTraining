import 'package:meta/meta.dart';
import 'package:university_management/address.dart';

class Branch extends Address{
  /*
  * _id store branch ID
  * _name store branch name
  * */

  String _id, _name;
  Branch({
    @required String city,
    @required String country,
    @required String name,
    @required String postalCode,
    @required String state,
    String street
  }):super(
    city: city,
    country: country,
    postalCode: postalCode,
    state: state,
    street: street,
  ){
    _id = hashCode.toString();
    if( name == null ) throw('\'name\' is required');
    _name ??= name;
  }

  // some getter methods as utils

  String get branchId => _id;


  // [details] method can return branch details
  @override
  Map get details {
    var address = super.details;
    return {
      'branchId': _id,
      'name': _name,
      'address': address
    };
  }

  // [update] method can update Branch details
  @override
  void update({
    String city,
    String country,
    String name,
    String postalCode,
    String state,
    String street}) {
    super.update(
        street: street,
        city: city,
        state: state,
        postalCode:
        postalCode,
        country: country);
    _name ??= name;
  }
}