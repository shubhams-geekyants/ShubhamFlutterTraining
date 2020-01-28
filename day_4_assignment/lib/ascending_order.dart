class AssecndingOrder{
  List<int> _arr;
  AssecndingOrder(List<int> arr){
    _arr = arr;
  }
  List<int> getSortedList(){
    _arr.sort();
    return _arr;
  }
}