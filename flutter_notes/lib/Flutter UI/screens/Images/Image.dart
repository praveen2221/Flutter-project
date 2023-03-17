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
      body: Column(
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
         
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 100,
              color: Colors.blue,
              child: const Icon(Icons.arrow_forward_ios),
              alignment: Alignment.bottomCenter,
            ),
          ),
         
        ],
      ),
    );
  }
}
