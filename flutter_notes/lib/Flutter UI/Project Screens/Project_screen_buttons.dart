import 'package:flutter/material.dart';

import 'screens/Signup_screen.dart';
import 'screens/contact/Textbox.dart';
import 'screens/contact/contact_List.dart';
import 'screens/screen_Two.dart';
import 'screens/search_Field.dart';

class ProjectScreenButtons extends StatefulWidget {
  const ProjectScreenButtons({super.key});

  @override
  State<ProjectScreenButtons> createState() => _ProjectScreenButtonsState();
}

class _ProjectScreenButtonsState extends State<ProjectScreenButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Buttons(context, 'Screen_1_SignUp', const MySignUpScreen()),
              Buttons(context, "Screen Two", const MyScreenTwo()),
              Buttons(context, "Search screen", SearchScreen()),
              Buttons(context, "MyTextBox", MyTextBox()),
              Buttons(context, "ContactListScreen", ContactListScreen())
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
