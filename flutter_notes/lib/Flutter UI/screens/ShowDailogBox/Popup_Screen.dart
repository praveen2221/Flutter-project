import 'package:flutter/material.dart';

class MyPopUpScreen extends StatefulWidget {
  const MyPopUpScreen({super.key});

  @override
  State<MyPopUpScreen> createState() => _MyPopUpScreenState();
}

class _MyPopUpScreenState extends State<MyPopUpScreen> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('are you sure you want to logout'),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
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
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Logout',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
            _showMyDialog();
          },
        ),
      ),
    );
  }
}
