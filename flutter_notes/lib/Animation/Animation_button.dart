import 'package:flutter/material.dart';

import 'Animation Files/Explicit_Animation.dart';
import 'Animation Files/Implicit_Animation.dart';
import 'Animation Files/Ticker_Class.dart';
import 'Animation Files/Tween_Animation.dart';

class AnimationMainScreen extends StatefulWidget {
  const AnimationMainScreen({super.key});

  @override
  State<AnimationMainScreen> createState() => _AnimationMainScreenState();
}

class _AnimationMainScreenState extends State<AnimationMainScreen> {
  void onStepChange(int step) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Buttons(context, 'MyTweenAnimation', const MyTweenAnimation()),
              Buttons(
                  context, "MyImplicitAnimation", const MyImplicitAnimation()),
              Buttons(context, "MyExplicitAnimation", MyExplicitAnimation()),
              Buttons(context, 'MyTickerClass', MyTickerClass()),
            ],
          ),
        ),
      ),
    );
  }

  TextButton Buttons(BuildContext context, String text, Widget widget) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(text),
    );
  }
}
