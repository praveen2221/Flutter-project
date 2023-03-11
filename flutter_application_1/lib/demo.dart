import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 44, 108),
        title: const Text('Demo Page'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Wellcome to Demo Page",
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 21, 110), fontSize: 20),
            ),
            Container(
              color: Colors.blue,
              height: 50,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Close page',
                  style: TextStyle(
                      color: Color.fromARGB(255, 33, 21, 110), fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
