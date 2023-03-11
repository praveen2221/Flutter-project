// ignore: file_names
import 'package:flutter/material.dart';
import '../../Button _Widget/CustomButton.dart';

class MyCustomButton extends StatefulWidget {
  const MyCustomButton({super.key, required String title});

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Button"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton(
                text: "text",
                onPressed: () {},
                color: Colors.black,
                textColor: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
