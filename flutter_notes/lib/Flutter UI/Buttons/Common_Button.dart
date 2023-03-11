// ignore: file_names
import 'package:flutter/material.dart';

import '../../Button _Widget/CommonButton.dart';

class MyCommonButton extends StatefulWidget {
  const MyCommonButton({super.key});

  @override
  State<MyCommonButton> createState() => _MyCommonButtonState();
}

class _MyCommonButtonState extends State<MyCommonButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CommonButton(
                title: "CommonButton",
                onClick: (() {}),
                size: const Size(100, 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
