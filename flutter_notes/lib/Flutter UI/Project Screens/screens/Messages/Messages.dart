import 'dart:ffi';

import 'package:flutter/material.dart';

import 'Whap_Drawer.dart';

class MyMessages extends StatefulWidget {
  const MyMessages({super.key});

  @override
  State<MyMessages> createState() => _MyMessagesState();
}

class _MyMessagesState extends State<MyMessages> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: const Color(0xFF171717),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _globalKey.currentState!.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10),
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Messages",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Online",
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Group",
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "More",
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
              height: 220,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 65, 207, 185),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Favorite Contacts",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        BuildContactAvatar("Bala",
                            "https://image.shutterstock.com/image-photo/smiling-young-middle-eastern-man-260nw-2063524544.jpg"),
                        BuildContactAvatar("Bala",
                            "https://images.unsplash.com/photo-1503443207922-dff7d543fd0e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWVufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                        BuildContactAvatar("Bala",
                            "https://media.gettyimages.com/id/1179420343/photo/smiling-man-outdoors-in-the-city.jpg?s=612x612&w=gi&k=20&c=n663L5A4XlwcUvNpX_eu4ur1sMmrD6dt_c1mbWjrLXk="),
                        BuildContactAvatar("Bala",
                            "https://images.unsplash.com/photo-1552642986-ccb41e7059e7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFuJTIwaGFpcnxlbnwwfHwwfHw%3D&w=1000&q=80"),
                        BuildContactAvatar("Bala",
                            "https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-65479.jpg"),
                        BuildContactAvatar("Bala",
                            "https://thumbs.dreamstime.com/b/handsome-man-hair-style-beard-beauty-face-portrait-fashion-male-model-black-hair-high-resolution-handsome-man-125031765.jpg"),
                        BuildContactAvatar("Bala",
                            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWVufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                        BuildContactAvatar("Bala",
                            "https://iheartcraftythings.com/wp-content/uploads/2021/04/Man-DRAWING-%E2%80%93-STEP-10.jpg"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 365,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: ListView(
                padding: const EdgeInsets.only(left: 25),
                children: [
                  buildConversationRow(
                      "Bala",
                      "Hello! how are you",
                      "https://image.shutterstock.com/image-photo/smiling-young-middle-eastern-man-260nw-2063524544.jpg",
                      0),
                  buildConversationRow(
                      "Bala",
                      "Hello! how are you",
                      "https://image.shutterstock.com/image-photo/smiling-young-middle-eastern-man-260nw-2063524544.jpg",
                      5),
                  buildConversationRow(
                      "Bala",
                      "Hello! how are you",
                      "https://image.shutterstock.com/image-photo/smiling-young-middle-eastern-man-260nw-2063524544.jpg",
                      3),
                  buildConversationRow(
                      "Bala",
                      "Hello! how are you",
                      "https://image.shutterstock.com/image-photo/smiling-young-middle-eastern-man-260nw-2063524544.jpg",
                      0),
                  buildConversationRow(
                      "Bala",
                      "Hello! how are you",
                      "https://image.shutterstock.com/image-photo/smiling-young-middle-eastern-man-260nw-2063524544.jpg",
                      7),
                  buildConversationRow(
                      "Bala",
                      "Hello! how are you",
                      "https://image.shutterstock.com/image-photo/smiling-young-middle-eastern-man-260nw-2063524544.jpg",
                      0),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromARGB(255, 65, 207, 185),
          child: const Icon(Icons.edit),
        ),
      ),
      drawer: WhatDrawer(),
    );
  }

  Column buildConversationRow(
      String name, String message, String filename, int msgCount) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                userAvatar(filename: filename),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                          color: Colors.black,
                        )),
                    const SizedBox(height: 5),
                    Text(message,
                        style: const TextStyle(
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 5),
              child: Column(
                children: [
                  const Text(
                    '12:03',
                    style: TextStyle(fontSize: 10),
                  ),
                  const SizedBox(height: 10),
                  if (msgCount > 0)
                    CircleAvatar(
                      radius: 7,
                      backgroundColor: const Color.fromARGB(255, 65, 207, 185),
                      child: Text(
                        msgCount.toString(),
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
        const Divider(
          indent: 70,
        ),
      ],
    );
  }

  Padding BuildContactAvatar(String name, String filename) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          userAvatar(
            filename: filename,
          ),
          const SizedBox(height: 5),
          Text(name,
              style: const TextStyle(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

class userAvatar extends StatelessWidget {
  final String filename;
  const userAvatar({
    super.key,
    required this.filename,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 29,
        backgroundImage: Image.network("$filename").image,
      ),
    );
  }
}
