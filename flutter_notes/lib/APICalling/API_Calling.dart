import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'class/Business.dart';
import 'class/Category.dart';

class MyAPICalling extends StatefulWidget {
  const MyAPICalling({
    Key? key,
  }) : super(key: key);

  @override
  _MyAPICallingState createState() => _MyAPICallingState();
}

class _MyAPICallingState extends State<MyAPICalling> {
  // Create a list to hold the items from the API
  List<dynamic> categoryList = [];
  Business? businessData;
  var map = {'name': 'John Doe', 'email': 'johndoe@example.com', 'age': 32};
  StreamController<int> _counterController = StreamController<int>();
  int counter = 0;
  @override
  void initState() {
    super.initState();

    // Call the getItems function when the stateful widget is first created
    getItems();
    getBusiness();
  }

  /// Function to make the API call
  Future<List<dynamic>> getItems() async {
    final response = await http
        .get(Uri.parse('http://demo6840779.mockable.io/businessCategoryList'));

    if (response.statusCode == 200) {
      String contentType;
      contentType = response.headers["content-type"].toString();
      print("response");
      // If the call to the API was successful, parse the JSON
      setState(() {
        var items = json.decode(response.body);
        categoryList = items.map((x) => Category.fromJson(x)).toList();
      });
      return categoryList;
    } else {
      // If that call was not successful, throw an error
      throw Exception('Failed to load items');
    }
  }

  Future<Business?> getBusiness() async {
    final response = await http.get(
        Uri.parse('http://demo6840779.mockable.io/businessDetails'),
        headers: {});

    if (response.statusCode == 200) {
      var business;
      // var businessData;
      // If the call to the API was successful, parse the JSON
      setState(() {
        // business = businessFromJson(response.body);
        business = json.decode(response.body);
        businessData = Business.fromJson(business);
        print("business:" + businessData!.businessId);
        //   businessData =  Business.fromJson(business);

        //  Business.fromJson(business);
      });
      return businessData;
    } else {
      // If that call was not successful, throw an error
      throw Exception('Failed to load items');
    }
  }

//  Uri(scheme:'https',
//  host:'demo6840779.mockable.io',
//  path:'/businessCategoryList')
  deleteBusiness() async {
    final response = await http.delete(Uri.parse(
      'http://demo6840779.mockable.io/deleteList/1',
    ));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      String message = data['success'];
      var snackBar = SnackBar(
        content: Text(message),
      );
      print(message);
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // If the call to the API was successful, parse the JSON
      setState(() {});
      return data['success'];
    } else {
      // If that call was not successful, throw an error
      throw Exception('Failed to load items');
    }
  }

  insertBusiness() async {
    Map<String, String> header = {
      "Content-Type": "application/json",
    };
    Map<String, String> data = {
      "email": "praveen@gmail.com",
      "password": "12345678"
    };
    // final response = await http.post(
    //     Uri.parse(
    //       ' http://demo6840779.mockable.io/insertRecord',
    //     ),
    //     headers: header,
    //     body: data);
    final response = await http.post(
      Uri.parse(
        'http://demo6840779.mockable.io/insertRecord',
      ),
      // headers: header,
      // body: data
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      print(responseData['success'].toString());
      print(responseData['message'].toString());
      String message = responseData['message'];
      var snackBar = SnackBar(
        content: Text(message),
      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // If the call to the API was successful, parse the JSON
      setState(() {});
      return data['success'];
    } else {
      // If that call was not successful, throw an error
      throw Exception('Failed to load items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: businessData != null && businessData != ""
            ? Text(businessData!.businessName)
            : const Text("API Example"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                  leading: const Icon(
                    Icons.umbrella_outlined,
                    color: Colors.purple,
                  ),
                  trailing: InkWell(
                    onTap: () {
                      deleteBusiness();
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.greenAccent,
                    ),
                  ),
                  title: Text('${categoryList[index].categoryName}'),
                  subtitle: Text('${categoryList[index].categoryStatus}'),
                  onTap: () {/* react to the tile being tapped */}),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          insertBusiness();
        },
        child: const Icon(Icons.add),
      ),

      //  Text(businessData?.businessName ?? "")
      // ListView.builder(
      //   itemCount: categoryList.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(categoryList[index].categoryName.toString()),
      //       subtitle: Text(categoryList[index].categoryStatus.toString()),
      //     );
      //   },
      // ),
    );
  }
}
