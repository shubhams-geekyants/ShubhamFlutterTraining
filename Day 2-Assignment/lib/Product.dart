class Product {
  String fullName;
  bool isAvailable;
  double price, discount, newAmount;
  Product(String fullName, bool isAvailable, double price, double discount) {
    this.fullName = fullName;
    this.isAvailable = isAvailable;
    this.price = price;
    this.discount = discount;
  }
  void printProduct(){
    newAmount = price * (100 -  discount)/100;
    print('Name: ${fullName}');
    print('Actual Price ${price}');
    print('Discount: ${discount}');
    print('Available: ${isAvailable?'YES':'NO'}');
    print('Discounted Price: ${newAmount}');
  }
}