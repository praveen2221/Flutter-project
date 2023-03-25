import 'package:flutter/material.dart';

import '../../../Button _Widget/CircularProgressIndicator/CustomCircularIndicator.dart';

class MyCircularProgressIndicator extends StatefulWidget {
  const MyCircularProgressIndicator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCircularProgressIndicatorState createState() =>
      _MyCircularProgressIndicatorState();
}

class _MyCircularProgressIndicatorState
    extends State<MyCircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CustomCircularIndicator Demo',
        ),
      ),
      body: Center(
        child: CustomCircularProgressIndicator(
          strokeWidth: 5.0,
          radius: 50.0,
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
