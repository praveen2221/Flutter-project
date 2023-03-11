void main() {
  for (var i = 0; i < 5; i++) {
    print(i);
  }
  ;

  print("Next Condition");
  List<int> list = [1, 2, 3, 4, 5];
  for (var entry in list) {
    //print(entry);
  }
  list.forEach((Entry) {
    print(Entry);
  });
}
