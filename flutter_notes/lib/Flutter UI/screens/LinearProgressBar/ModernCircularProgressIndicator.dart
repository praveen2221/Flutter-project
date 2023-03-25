import 'package:flutter/material.dart';

import '../../../Button _Widget/CircularProgressIndicator/ModernCircularProgressIndicator.dart';

class MyModernCircularProgressIndicator extends StatefulWidget {
  const MyModernCircularProgressIndicator({super.key});

  @override
  State<MyModernCircularProgressIndicator> createState() =>
      _MyModernCircularProgressIndicatorState();
}

class _MyModernCircularProgressIndicatorState
    extends State<MyModernCircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return const ModernCircularProgressIndicator();
  }
}
