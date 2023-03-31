import 'package:flutter/material.dart';

import '../DateTimePicker/Date_Time_Picker.dart';
import '../TabBarView/TabBarButton/TabBar_Button1.dart';
import '../Project Screens/screens/SignUp screen/Text_form_field.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;
  final List<Widget> pageOptions = [
    Center(
      child: Icon(Icons.home_max_rounded),
    ),
    Center(
      child: Icon(Icons.view_agenda),
    ),
    Center(
      child: Icon(Icons.settings),
    ),
  ];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_stream),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
          //  Navigator.pushNamed(context, pageOptions[selectedIndex]);
        },
      ),
      body: pageOptions[selectedIndex],
    );
  }
}
