import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  Contact({
    required this.name,
    required this.contact,
  });

  String name;
  String contact;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json["name"],
        contact: json["contact"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "contact": contact,
      };
}
