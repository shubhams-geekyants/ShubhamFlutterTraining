
class Branch{
  String name, code, location;
  DateTime openTime, closeTime;
  Branch(String name, String code, String location, DateTime openTime, DateTime closeTime) {
    this.name = name;
    this.code = code;
    this.location = location;
    this.openTime = openTime;
    this.closeTime = closeTime;
  }
}