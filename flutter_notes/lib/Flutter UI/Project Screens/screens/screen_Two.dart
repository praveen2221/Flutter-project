import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../APICalling/class/Category.dart';

class MyScreenTwo extends StatefulWidget {
  const MyScreenTwo({super.key});

  @override
  State<MyScreenTwo> createState() => _MyScreenTwoState();
}

class _MyScreenTwoState extends State<MyScreenTwo> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];

  List<dynamic> categoryList = [];
  @override
  void initState() {
    super.initState();

    // Call the getItems function when the stateful widget is first created
    getItems();
  }

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

  void _searchForItems(String query) {
    // Perform the search logic here, using the query parameter
    // to filter items and update the _searchResults list
    setState(() {
      _searchResults = categoryList
          .where((category) =>
              category.categoryName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 26, 37, 52).withOpacity(0.80),
              Colors.white.withOpacity(0.20),
            ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(
                    height: 30), // Add some padding for the search bar
                TextField(
                  onChanged: (value) => _searchForItems(value),
                  decoration: InputDecoration(
                    filled: true, // Enable filling of the decoration background
                    fillColor: Colors
                        .white, // Set the background color of the decoration
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.list_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 92, 110, 135),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.map, color: Colors.white),
                              Text(
                                "Map",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.list, color: Colors.white),
                              Text("List",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.favorite, color: Colors.white),
                              Text(
                                "Favorites",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: _searchResults.isEmpty
                      ? ListView.builder(
                          itemCount: categoryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadowColor: Colors.black,
                                elevation: 10,
                                child: ListTile(
                                    leading: const Icon(
                                      Icons.umbrella_outlined,
                                      color: Colors.purple,
                                    ),
                                    trailing: InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                    title: Text(
                                        '${categoryList[index].categoryName}'),
                                    subtitle: Text(
                                        '${categoryList[index].categoryStatus}'),
                                    onTap: () {
                                      /* react to the tile being tapped */
                                    }),
                              ),
                            );
                          })
                      : ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title:
                                  Text('${_searchResults[index].categoryName}'),
                            );
                          }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
