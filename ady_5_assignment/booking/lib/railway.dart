class Railway{
  static int _sheets = 50, _booked = 0;

  Railway(){
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