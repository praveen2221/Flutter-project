// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_notes/Flutter%20UI/Buttons/Elevated_Button.dart';

class MyFloatingActionButtons extends StatefulWidget {
  const MyFloatingActionButtons({super.key, required String title});

  @override
  State<MyFloatingActionButtons> createState() =>
      _MyFloatingActionButtonsState();
}

class _MyFloatingActionButtonsState extends State<MyFloatingActionButtons> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FloatingAction Button"),
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
