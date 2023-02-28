import 'dart:core';
import 'dart:convert';

void main() {
  //core library
  String message = 'Hello. world';

  print(message.substring(0, 5));
  print(message.toUpperCase());
  print(message.toLowerCase());

  var dartlang = Uri.parse('http://dartlang.org/');
  print(dartlang);

//core library
  var now = DateTime.now();
  var barlineWallFell = DateTime(1987, 11, 19);
  print(barlineWallFell);
  var moonLanding = DateTime.parse("1987-11-19");
  print(moonLanding);

//convert library encode and decode
  var email = {"0": "praveenap2221@gmail.com", "1": "praveenap3331@gmail.com"};
  String encoded = json.encode(email);
  var decoded = json.decode(encoded);
  print(decoded);
  print(decoded["0"]);
}
