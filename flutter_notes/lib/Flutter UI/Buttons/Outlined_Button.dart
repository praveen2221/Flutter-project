// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_notes/Flutter%20UI/Buttons/Elevated_Button.dart';

class MyOutLinedButtons extends StatefulWidget {
  const MyOutLinedButtons({super.key, required String title});

  @override
  State<MyOutLinedButtons> createState() => _MyOutLinedButtonsState();
}

class _MyOutLinedButtonsState extends State<MyOutLinedButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OutLinedButton"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                child: const Text('OutLined Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
