import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyExpanded extends StatefulWidget {
  const MyExpanded({super.key});

  @override
  State<MyExpanded> createState() => _MyExpandedState();
}

class _MyExpandedState extends State<MyExpanded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                height: 100,
                width: double.infinity,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text('Expanded Widget'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
