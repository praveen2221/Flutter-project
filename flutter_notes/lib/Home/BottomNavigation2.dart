import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Flutter UI/Drawer/Drawer.dart';
import '../Flutter UI/TabBarView/TabBarView.dart';
import 'TabBar_Home.dart';
import '../Flutter UI/TabBarView/TabBar_Three.dart';

class CustomButtomScreen extends StatefulWidget {
  const CustomButtomScreen({Key? key}) : super(key: key);

  @override
  _CustomButtomScreenState createState() => _CustomButtomScreenState();
}

class _CustomButtomScreenState extends State<CustomButtomScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    TabBarHome(),
    TabBarThree(title: ''),
    MyDrawer(title: ''),
    MyTabBarView(title: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Check if the user is on the home page
        if (Navigator.of(context).canPop()) {
          // If not, allow the default back button behavior
          return true;
        } else {
          // If on the home page, close the app
          SystemNavigator.pop();
          return false;
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 4.0,
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: selectedIndex == 0
              ? Colors.purple
              : selectedIndex == 3
                  ? Colors.blue
                  : Colors.black,
          shape: const CircularNotchedRectangle(),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BuildContainer(Icons.home, 0),
                BuildContainer(Icons.heat_pump_rounded, 1),
                BuildContainer(Icons.settings, 2),
                BuildContainer(Icons.lock, 3),
              ],
            ),
          ),
        ),
        body: _widgetOptions[selectedIndex],
      ),
    );
  }

  GestureDetector BuildContainer(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
        decoration: index == selectedIndex
            ? BoxDecoration(
                border: const Border(
                  bottom: BorderSide(width: 4, color: Colors.green),
                ),
                gradient: LinearGradient(colors: [
                  Colors.greenAccent.withOpacity(0.6),
                  Colors.greenAccent.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : const BoxDecoration(),
        child: Icon(icon,
            color: index == selectedIndex ? Colors.green : Colors.grey,
            size: index == selectedIndex ? 40 : 30),
      ),
    );
  }
}
