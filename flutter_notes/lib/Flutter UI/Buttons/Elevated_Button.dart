// ignore: file_names
import 'package:flutter/material.dart';

class MyElevatedButton extends StatefulWidget {
  const MyElevatedButton({super.key, required String title});

  @override
  State<MyElevatedButton> createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elevated button"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
            ],
          ),
        ),
      ),
    );
  }
}
