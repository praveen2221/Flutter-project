import 'package:flutter/material.dart';

import '../Bottom_sheet.dart';
import '../Expansion Panel/ExpansionPanel.dart';
import '../GridView/Grid_View.dart';
import '../GridView/ListView.dart';
import '../Icons/Icons.dart';
import '../Images/Image.dart';
import '../ShowDailogBox/Popup_Screen.dart';
import '../ShowDailogBox/ShowDailog_Box.dart';
import '../Snack_Bar.dart';
import '../chip/chip.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Buttons(context, 'Bottom Sheet', const Bottomsheet()),
              Buttons(context, "PopUp Screen", const MyPopUpScreen()),
              Buttons(context, "ShowDailog Box", MyShowDailogBox()),
              Buttons(context, 'Snack Bar', const MySnackBar()),
              Buttons(context, "Expansion Panel", const MyExpansionPanel()),
              Buttons(context, "Icons", const MyIcons()),
              Buttons(context, "Images", const MyImages()),
              Buttons(context, "chip", MyChip()),
              Buttons(context, "GridView", MyGridView()),
              Buttons(context, "List View", MyListView())
            ],
          ),
        ),
      ),
    );
  }

  TextButton Buttons(BuildContext context, String text, Widget widget) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(text),
    );
  }
}
