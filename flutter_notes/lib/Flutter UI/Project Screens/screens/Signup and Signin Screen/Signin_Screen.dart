import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/Flutter%20UI/Project%20Screens/screens/SignUp%20screen/Signup_screen.dart';
import 'package:flutter_notes/Flutter%20UI/Project%20Screens/screens/Signup%20and%20Signin%20Screen/Colors/colors_utils.dart';
import 'package:flutter_notes/Home/BottomNavigation2.dart';

import '../../../../Button _Widget/reusable Widget/Reusable_widget.dart';
import 'MySignup_Screen.dart';

class MySigninScreen extends StatefulWidget {
  const MySigninScreen({super.key});

  @override
  State<MySigninScreen> createState() => _MySigninScreenState();
}

class _MySigninScreenState extends State<MySigninScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2893"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: [
                logoWidget("assets/loginLogo.png"),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  myController: _emailController,
                  text: "Enter UserName",
                  icon: Icons.email,
                  isPassword: false,
                ),
                reusableTextField(
                  myController: _passwordController,
                  text: "Password",
                  icon: Icons.lock,
                  isPassword: true,
                ),
                signInSignUpButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomButtomScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MySignUpScreens()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
