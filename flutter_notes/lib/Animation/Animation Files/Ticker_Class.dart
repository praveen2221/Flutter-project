// Ticker class

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MyTickerClass extends StatefulWidget {
  @override
  _MyTickerClassState createState() => _MyTickerClassState();
}

class _MyTickerClassState extends State<MyTickerClass>
    with TickerProviderStateMixin {
  late Ticker _ticker;
  double _value = 0.0;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      setState(() {
        _value = elapsed.inSeconds.toDouble();
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Value: $_value',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
