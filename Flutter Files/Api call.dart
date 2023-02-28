void main() {
  List user = [
    {
      "id" : 1,
      "name": "Praveen",
    },
    {"id" : 2, "name": "Baskar"}
  ];
}

class user {
  int? id;
  String? name;

  user(this.id, this.name);

  user.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  user.toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["id"] = 1;
    data["name"] = "praveen";
  }
}
