String createOrderMessage () {
  var order = fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() {
  // Imagine that this function is more complex and slow
  return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
}

void main () {
  print(createOrderMessage());
}