import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController progress;

  @override
  void initState() {
    progress = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    progress.repeat();
    super.initState();

    //LinearProgressIndicator
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    progress.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Linear progress indicator with a fixed color',
              style: TextStyle(fontSize: 20),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress.value,
                  backgroundColor: Colors.grey,
                  strokeWidth: 6,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                Text(
                  '${(progress.value * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10.0), // set the border radius as needed
                    border: Border.all(
                        width: 3.0,
                        color: Colors.blueGrey), // optional border styling
                  ),
                  child: LinearProgressIndicator(
                    // minHeight: 20,
                    backgroundColor: Colors.blueGrey,
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                ),
                Text(
                  '${(controller.value * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10.0), // set the border radius as needed
                border: Border.all(
                    width: 1.0, color: Colors.grey), // optional border styling
              ),
              child: LinearProgressIndicator(
                value: 0.5, // set the progress value as needed
                backgroundColor:
                    Colors.grey, // set the background color as needed
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue), // set the progress color as needed
              ),
            )
          ],
        ),
      ),
    );
  }
}
