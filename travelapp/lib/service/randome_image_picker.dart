import 'dart:math';

class RandomImagePicker{
  static List<Map<String, String>> _imageData = [
    {
      'url':'assets/images/taj.png',
      'content': 'Taj Mahal',
      'location':'Agra, Uttar Pradesh',
    },
    {
      'url':'assets/images/varanasi.png',
      'content': 'Kashi',
      'location':'Varanasi, Uttar Pradesh',
    },
    {
      'url':'assets/images/backwaters.png',
      'content': 'Backwaters',
      'location':'Kerala',
    },
    {
      'url':'assets/images/akshardham.png',
      'content': 'Akshardham',
      'location':'Delhi',
    },
    {
      'url':'assets/images/golden_temple.png',
      'content': 'Golden Temple',
      'location':'Amritsar, Panjab',
    },
  ];
  static var _random = Random();
  static Map<String, String> random(){
    return _imageData[_random.nextInt(_imageData.length)];
  }
}