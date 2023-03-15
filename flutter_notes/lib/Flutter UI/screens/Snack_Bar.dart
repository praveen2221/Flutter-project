import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  const MySnackBar({super.key});

  @override
  State<MySnackBar> createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'SnackBar',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                action: SnackBarAction(
                  label: 'Action',
                  onPressed: () {
                    // Code to execute.
                  },
                ),
                content: const Text('Awesome SnackBar!'),
                duration: const Duration(milliseconds: 1500),
                width: 280.0, // Width of the SnackBar.
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, // Inner padding for SnackBar content.
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
