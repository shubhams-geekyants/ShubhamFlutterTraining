class Person{
  String _id, _name, _phoneNo, _email, _role;
  Person(this._name, this._email, [this._phoneNo, this._role='NOROLE']){
    _id = hashCode as String;
  }
  // getter method to get person data
  Map get getDetail{
    var dataToReturn = {
      'personId': _id,
      'personName': _name,
      'personEmail': _email,
      'personRole': _role,
    };
    if(_phoneNo != null){
      dataToReturn['phoneNo'] = _phoneNo;
    }
    return dataToReturn;
  }
  void updateData([String name, String email, String phoneNo, String role]){
    if(name != null) {
      _name = name;
    }
    if(email != null) {
      _email = email;
    }
    if(phoneNo != null){
      _phoneNo = phoneNo;
    }
    if(role != null){
      _role = role;
    }
    return;
  }
}