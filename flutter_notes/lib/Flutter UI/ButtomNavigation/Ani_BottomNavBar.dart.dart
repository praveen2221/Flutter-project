import 'package:flutter/material.dart';

import '../../Button _Widget/NavBarWidget/Bottom_NavBar_Widget.dart';
import '../Buttons/Common_Button.dart';

class MyAniBottomNavBar extends StatefulWidget {
  const MyAniBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyAniBottomNavBar> createState() => _MyAniBottomNavBarState();
}

class _MyAniBottomNavBarState extends State<MyAniBottomNavBar> {
  int current_index = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> pages = [
    const MyCommonButton(),
    const MyCommonButton(),
    const MyCommonButton(),
    const MyCommonButton(),
    const MyCommonButton(),
  ];

  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
      ),
      body: pages[current_index],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          Icon(Icons.call_split, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        onTap: (index) => OnTapped(index),
        color: Colors.blue,
        buttonBackgroundColor: Colors.green,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
      ),
    );
  }
}
