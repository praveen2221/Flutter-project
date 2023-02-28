void main(List<String> args) {
  String name = 'apple';
  if (name == 'apple') {
    print('yes1');
  } else if (name == 'orange') {
    print('yes2');
  } else if (name == 'grapes') {
    print('yes3');
  }
  ;
  //logical operators
  print("logical operator &&");
  if (name == 'orange' && name == 'apple') {
    print('yes');
  } else {
    print('no');
  }
  ;
  print("logical operator ||");
  if (name == 'orange' || name == 'apple') {
    print('yes');
  } else {
    print('no');
  }
}
