import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/Flutter%20UI/ButtomNavigation/Ani_BottomNavBar.dart.dart';

import '../ButtomNavigation/Bottom_NavigationBar.dart';
import '../ButtomNavigation/root_Screen.dart';
import '../Buttons.dart';
import 'screen_one.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class TabBarFour extends StatefulWidget {
  const TabBarFour({super.key});

  @override
  State<TabBarFour> createState() => _TabBarFourState();
}

class _TabBarFourState extends State<TabBarFour>
    with SingleTickerProviderStateMixin {
  SampleItem? selectedMenu;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            dragStartBehavior: DragStartBehavior.start,
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text('Tab Bar'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenOne(
                                title: '',
                              )));
                },
              ),
              const ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("TabBar"),
          backgroundColor: Colors.purple,
          elevation: 0,
          actions: [
            PopupMenuButton<SampleItem>(
              initialValue: selectedMenu,
              // Callback that sets the selected popup menu item.
              onSelected: (SampleItem item) {
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SampleItem>>[
                PopUp(context, "Animated BottomNavBar", MyAniBottomNavBar()),
                PopUp(context, "Root Screen", RootScreen()),
                PopUp(context, "My BottomNavBar",
                    MyBottomNavigationBar(title: '')),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 80,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 7),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.purple.withOpacity(0.60),
                    Colors.purple.withOpacity(1),
                  ], begin: Alignment.bottomRight, end: Alignment.topRight),
                  boxShadow: [
                    const BoxShadow(blurRadius: 30.0, color: Colors.purple),
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: TabBarTree(),
            ),
            TabBarBody()
          ],
        ),
      ),
    );
  }

  PopupMenuItem<SampleItem> PopUp(
      BuildContext context, String text, Widget widget) {
    return PopupMenuItem<SampleItem>(
      value: SampleItem.itemThree,
      child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => widget)));
          },
          child: Text(text)),
    );
  }

  TabBar TabBarTree() {
    return const TabBar(
      indicator: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green,
            Colors.blue,
            Colors.yellow,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      indicatorWeight: 3,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.fromLTRB(0, 40, 0, 5),
      isScrollable: true,
      tabs: [
        Tab(
          text: 'Buttons',
        ),
        Tab(
          text: 'Top charts',
        ),
        Tab(
          text: 'Children',
        ),
        Tab(
          text: 'Events',
        ),
        Tab(
          text: 'Premium',
        ),
        Tab(
          text: 'Categories',
        ),
      ],
    );
  }

  Expanded TabBarBody() {
    return const Expanded(
      child: TabBarView(
        children: [
          MyButtons(),
          Icon(Icons.chat_rounded),
          Icon(Icons.child_friendly),
          Icon(Icons.event),
          Icon(Icons.workspace_premium),
          Icon(Icons.category),
        ],
      ),
    );
  }
}
