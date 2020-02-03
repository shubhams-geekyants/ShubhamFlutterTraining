class Address{
  /*
  * _street store street(optional)
  * _city store city(required)
  * _state store state(required)
  * _postalCode store postal code(required)
  * _country store country(required)
  * */

  String _street, _city, _state, _postalCode, _country;

  Address({
    String city,
    String country,
    String postalCode,
    String state,
    String street,
  }) {
    if(city == null) throw('\'city\' is required');
    if(country == null) throw('\'country\' is required');
    if(postalCode == null) throw('\'postalCode\' is required');
    if(state == null) throw('\'state\' is required');
    _city = city;
    _country = country;
    _postalCode = postalCode;
    _street = street;
    _state = state;
  }

  // getter method 'details' return address
  Map get details {
    var dateToReturn = {
      'state': _state,
      'city': _city,
      'postalCode': _postalCode,
      'country': _country
    };
    if (_street != null) dateToReturn['street'] = _street;
    return dateToReturn;
  }

  // Method 'update' to update address
  void update({
    String street,
    String city,
    String state,
    String postalCode,
    String country
  }) {
    _street ??= street;
    _city ??= city;
    _state ??= state;
    _postalCode ??= postalCode;
    _country = country;
  }

}