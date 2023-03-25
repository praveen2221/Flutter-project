// Tween Animation

import 'package:flutter/material.dart';

class MyTweenAnimation extends StatefulWidget {
  const MyTweenAnimation({Key? key}) : super(key: key);

  @override
  _MyTweenAnimationState createState() => _MyTweenAnimationState();
}

class _MyTweenAnimationState extends State<MyTweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 100, end: 300).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
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
        title: Text("Tween Animation Example"),
      ),
      body: Center(
        child: Container(
          width: _animation.value,
          height: _animation.value,
          color: Colors.green,
        ),
      ),
    );
  }
}