// Ticker class

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Alert Dialog'),
          content: Text('This is an alert dialog.'),
          actions: [
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                // Do something when the user presses the OK button.
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'Value: $_value',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            WidgetAnimator(
                incomingEffect:
                    WidgetTransitionEffects.incomingSlideInFromBottom(),
                child: ElevatedButton(
                  onPressed: () {
                    _showMyDialog();
                  },
                  child: Text("alert"),
                )),
          ],
        ),
      ),
    );
  }
}
