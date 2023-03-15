import 'package:flutter/material.dart';

class MyImages extends StatefulWidget {
  const MyImages({super.key});

  @override
  State<MyImages> createState() => _MyImagesState();
}

class _MyImagesState extends State<MyImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/car.jpeg",
                width: 200,
                height: 200,
              ),
              Image.network(
                "https://fastly.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI",
                width: 200,
                height: 200,
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: Icon(Icons.album),
                      title: Text('The Enchanted Nightingale'),
                      subtitle:
                          Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('LISTEN'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),

              //chip
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  child: Text('A'),
                ),
                label: Text('Avatar Chip'),
                labelStyle: TextStyle(color: Colors.white),
                backgroundColor: Colors.grey[600],
                deleteIcon: Icon(Icons.cancel),
                onDeleted: () {
                  // code to handle chip deletion
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Chip(
                    label: Text('Chip 1'),
                    backgroundColor: Colors.red,
                  ),
                  Chip(
                    label: Text('Chip 2'),
                    backgroundColor: Colors.blue,
                  ),
                  Chip(
                    label: Text('Chip 3'),
                    backgroundColor: Colors.green,
                  ),
                  Chip(
                    label: Text('Chip 4'),
                    backgroundColor: Colors.orange,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
