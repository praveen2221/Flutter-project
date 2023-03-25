// Explicit Animation

import 'package:flutter/material.dart';

class MyExplicitAnimation extends StatefulWidget {
  const MyExplicitAnimation({Key? key}) : super(key: key);

  @override
  _MyExplicitAnimationState createState() => _MyExplicitAnimationState();
}

class _MyExplicitAnimationState extends State<MyExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation =
        Tween<double>(begin: 0.2, end: 4).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explicit Animation Example"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _animationController.forward();
          },
          child: ScaleTransition(
            scale: _animation,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
