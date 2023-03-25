import 'package:flutter/material.dart';

/// IMPLICITY Animation

class MyImplicitAnimation extends StatefulWidget {
  const MyImplicitAnimation({Key? key}) : super(key: key);

  @override
  _MyImplicitAnimationState createState() => _MyImplicitAnimationState();
}

class _MyImplicitAnimationState extends State<MyImplicitAnimation> {
  double _opacity = 1.0;

  void _toggleOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implicit Animation Example"),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 2),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleOpacity,
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.opacity),
      ),
    );
  }
}
