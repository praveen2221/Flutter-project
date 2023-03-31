import 'package:flutter/material.dart';

import 'Messages.dart';

class WhatDrawer extends StatefulWidget {
  const WhatDrawer({super.key});

  @override
  State<WhatDrawer> createState() => _WhatDrawerState();
}

class _WhatDrawerState extends State<WhatDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 275,
      backgroundColor: Colors.black26,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(40)),
      ),
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 26, 25, 25),
            borderRadius: BorderRadius.horizontal(right: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 53, 53, 53),
                spreadRadius: 30,
                blurRadius: 20,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(width: 52),
                      Text(
                        "Settings",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: const [
                      userAvatar(
                          filename:
                              "https://iheartcraftythings.com/wp-content/uploads/2021/04/Man-DRAWING-%E2%80%93-STEP-10.jpg"),
                      SizedBox(width: 12),
                      Text("Praveen A",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 35),
                  DrawerItems(Icons.key, "Account"),
                  DrawerItems(Icons.chat, "Chats"),
                  DrawerItems(Icons.notifications, "Notifications"),
                  DrawerItems(Icons.storage, "Data and storage"),
                  DrawerItems(Icons.key, "Help"),
                  const Divider(
                    color: Colors.green,
                  ),
                  const SizedBox(height: 10),
                  DrawerItems(Icons.group, "Invite a friends"),
                ],
              ),
              DrawerItems(Icons.login_outlined, "Log out"),
            ],
          ),
        ),
      ),
    );
  }

  InkWell DrawerItems(IconData icon, String name) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(width: 52),
            Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
