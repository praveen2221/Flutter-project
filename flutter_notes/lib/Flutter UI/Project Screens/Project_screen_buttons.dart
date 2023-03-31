import 'package:flutter/material.dart';

import 'screens/SignUp screen/Signup_screen.dart';
import 'screens/SignUp screen/Text_form_field.dart';
import 'screens/Signup and Signin Screen/Signin_Screen.dart';
import 'screens/contact/Textbox.dart';
import 'screens/Messages/Messages.dart';
import 'screens/search screen/screen_Two.dart';
import 'screens/search screen/search_Field.dart';

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
              Buttons(context, "login", MyTextFormField()),
              Buttons(context, "Signiin and Signup", MySigninScreen()),
              Buttons(context, "Screen Two", const MyScreenTwo()),
              Buttons(context, "Search screen", SearchScreen()),
              Buttons(context, "ContactListScreen", MyTextBox()),
              Buttons(context, "Messages", MyMessages()),
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
