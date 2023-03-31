import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchResult {
  final String title;
  final String description;

  SearchResult({required this.title, required this.description});
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<SearchResult> _searchResults = [];
  bool _isLoading = false;

  Future<void> _fetchSearchResults(String searchTerm) async {
    setState(() {
      _isLoading = true;
      _searchResults.clear();
    });

    final response = await http
        .get(Uri.parse('https://api.example.com/search?query=$searchTerm'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;

      data.forEach((result) {
        final title = result['title'] as String;
        final description = result['description'] as String;
        final searchResult =
            SearchResult(title: title, description: description);
        _searchResults.add(searchResult);
      });

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load search results');
    }
  }

  void _filterSearchResults(String searchTerm) {
    if (searchTerm.isNotEmpty) {
      _fetchSearchResults(searchTerm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterSearchResults(value);
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(_searchResults[index].title),
                        subtitle: Text(_searchResults[index].description),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
