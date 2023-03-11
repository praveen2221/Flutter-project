// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_notes/Flutter%20UI/Buttons/Elevated_Button.dart';
import 'package:getwidget/getwidget.dart';

class MyGfButton extends StatefulWidget {
  const MyGfButton({super.key, required String title});

  @override
  State<MyGfButton> createState() => _MyGfButtonState();
}

class _MyGfButtonState extends State<MyGfButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GFButton"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GFButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Solid Button",
              ),
              GFButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Pill Button",
                shape: GFButtonShape.square,
              ),
              GFButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Home",
                icon: Icon(Icons.home),
                position: GFPosition.end,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
