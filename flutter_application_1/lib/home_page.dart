import 'package:flutter/material.dart';

import 'demo.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  SampleItem? selectedMenu;

  static const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  String dropdownValue = list.first;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Perform search action
            },
          ),
          PopupMenuButton<SampleItem>(
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (SampleItem item) {
              setState(() {
                selectedMenu = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemOne,
                child: Text('Item 1'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemTwo,
                child: Text('Item 2'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemThree,
                child: Text('Item 3'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:,You have pushed the button this many times:',
                style: TextStyle(overflow: TextOverflow.clip),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DemoPage()));
                },
                child: const Text('Text Button'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DemoPage()));
                },
                child: const Text(
                  'Demo Page',
                  style: TextStyle(
                      color: Color.fromARGB(255, 33, 21, 110), fontSize: 20),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // Set the button's text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 8), // Set the button's padding
                  textStyle: const TextStyle(
                      fontSize: 20), // Set the button's text style
                  shape: RoundedRectangleBorder(
                    // Set the button's border shape
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Action to be performed when the button is pressed
                  print('Elevated Button pressed');
                  debugPrint("Pressed");
                },
                child: const Text(
                  'Elevated Button',
                  style: TextStyle(overflow: TextOverflow.fade),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'This is a very long text that will fade out if it exceeds the width of the container.',
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  // Action to be performed when the button is pressed
                  print('Outlined Button pressed');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  side: const BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 33, 33,
                          243)), // Set the button's border width and color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8), // Set the button's padding
                  textStyle: const TextStyle(
                      fontSize: 16), // Set the button's text style
                  shape: RoundedRectangleBorder(
                    // Set the button's border shape
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('My Button'),
              ),
              IconButton(
                onPressed: () {
                  // Action to be performed when the button is pressed
                  print('Icon Button pressed');
                },
                icon: const Icon(
                    Icons.access_alarms), // Set the icon to be displayed
                color: Colors.blue, // Set the color of the icon
                iconSize: 32, // Set the size of the icon
                tooltip: 'Favorite', // Set the tooltip text
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        foregroundColor: Colors.black,
        elevation: 5,
        highlightElevation: 10,
        splashColor: Colors.red,
        backgroundColor: Colors.blueGrey,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
