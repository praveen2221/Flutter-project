import 'package:flutter/material.dart';

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({super.key});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Bottom Sheet',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
            // _showMyDialog();
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Wrap(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.share),
                      title: Text('Share'),
                    ),
                    ListTile(
                      leading: Icon(Icons.copy),
                      title: Text('Copy Link'),
                    ),
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
