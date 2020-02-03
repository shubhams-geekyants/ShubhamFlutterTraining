class Bus{
  static int _sheets = 20, _booked = 0;

  Bus(){
    _sheets = 100;
    _booked = 0;
  }

  static int get available => _sheets - _booked;

  static bool book(){

    if( _sheets <= _booked)return false;

    _booked++;

    return true;
  }
}