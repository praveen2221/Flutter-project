// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_notes/Flutter%20UI/Buttons/Elevated_Button.dart';

import 'Flutter UI/Buttons/Common_Button.dart';
import 'Flutter UI/Buttons/Custom_Buttton.dart';
import 'Flutter UI/Buttons/GF_Button.dart';
import 'Flutter UI/Buttons/DropDown_Button.dart';
import 'Flutter UI/Buttons/FloatingAction_Button.dart';
import 'Flutter UI/Buttons/Icon_Button.dart';
import 'Flutter UI/Buttons/Outlined_Button.dart';
import 'Flutter UI/Buttons/PopUpMenu_Button.dart';
import 'Flutter UI/Buttons/Text_Button.dart';
import 'Flutter UI/Drawer/Drawer.dart';
import 'Flutter UI/TabBarView/TabBarView.dart';

class MyButtons extends StatefulWidget {
  const MyButtons({super.key});

  @override
  State<MyButtons> createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 223, 155, 235).withOpacity(0.80),
              Colors.white.withOpacity(0.20),
            ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Buttons(
                      context, 'Text Button', const MyTextButton(title: '')),
                  Buttons(context, "Elevant Button",
                      const MyElevatedButton(title: '')),
                  Buttons(context, 'Outlined Button',
                      const MyOutLinedButtons(title: '')),
                  Buttons(
                      context, "Icon Button", const MyIconButtons(title: '')),
                  Buttons(context, "DropDown Button",
                      const MyDropDownButtons(title: '')),
                  Buttons(context, "PopUpMenuButton",
                      const MyPopUpMenuButtons(title: '')),
                  Buttons(context, "FloatingActionButton Button",
                      const MyFloatingActionButtons(title: '')),
                  Buttons(context, "GF Button", const MyGfButton(title: '')),
                  Buttons(context, "Custom Button",
                      const MyCustomButton(title: '')),
                  Buttons(context, "Common Button", const MyCommonButton()),
                  Buttons(context, "Drawer Button", const MyDrawer(title: '')),
                  Buttons(context, "TabBarView", const MyTabBarView(title: '')),
                ],
              ),
            ),
          ),
        ],
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
