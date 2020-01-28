dynamic getBill(int requiredMilk, List<dynamic> milkClassInStock){
  var totalMilk = milkClassInStock.reduce((curr, next) => curr + next);
  if(totalMilk - 1 < requiredMilk) {
    return {};
  } else {
    milkClassInStock.sort();
    var milkBill = {};
    for(var i = 0; i < milkClassInStock.length; ++i){
      milkBill[milkClassInStock[i]] = 0;
    }
    for(var i = milkClassInStock.length - 1; i >= 0; --i){
      var temp = milkClassInStock[i];
      if(temp - requiredMilk >= 0){
        milkBill[temp] = requiredMilk;
        requiredMilk = 0;
      }else{
        milkBill[temp] = temp;
        requiredMilk -= temp;
      }
    }
    return milkBill;
  }
}