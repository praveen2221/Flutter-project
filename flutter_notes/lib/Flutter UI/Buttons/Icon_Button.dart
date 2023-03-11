// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_notes/Flutter%20UI/Buttons/Elevated_Button.dart';

class MyIconButtons extends StatefulWidget {
  const MyIconButtons({super.key, required String title});

  @override
  State<MyIconButtons> createState() => _MyIconButtonsState();
}

class _MyIconButtonsState extends State<MyIconButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon Button"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
            ],
          ),
        ),
      ),
    );
  }
}
