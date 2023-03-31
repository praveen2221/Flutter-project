import 'package:flutter/material.dart';

class MysearchBar extends StatefulWidget {
  const MysearchBar({super.key});

  @override
  State<MysearchBar> createState() => _MysearchBarState();
}

class _MysearchBarState extends State<MysearchBar> {
  String searchTerm = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchTerm = value;
                  // Perform search here using the searchTerm variable
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
