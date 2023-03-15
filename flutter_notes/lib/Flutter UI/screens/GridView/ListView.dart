import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final List<String> entries = <String>['A', 'B', 'C', 'd'];
  final List<int> colorCodes = <int>[600, 500, 100, 50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView(
      //   padding: const EdgeInsets.all(8),
      //   children: <Widget>[
      //     Container(
      //       height: 50,
      //       color: Colors.amber[600],
      //       child: const Center(child: Text('Entry A')),
      //     ),
      //     Container(
      //       height: 50,
      //       color: Colors.amber[500],
      //       child: const Center(child: Text('Entry B')),
      //     ),
      //     Container(
      //       height: 50,
      //       color: Colors.amber[100],
      //       child: const Center(child: Text('Entry C')),
      //     ),
      //   ],
      // ),
      // body: ListView.builder(
      //     padding: const EdgeInsets.all(8),
      //     itemCount: entries.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Container(
      //         height: 50,
      //         color: Colors.amber[colorCodes[index]],
      //         child: Center(child: Text('Entry ${entries[index]}')),
      //       );
      //     }),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
