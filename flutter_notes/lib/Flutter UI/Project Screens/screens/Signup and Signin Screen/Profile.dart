import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Signin_Screen.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("SignOut");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MySigninScreen()));
              });
            },
            child: Text("LogOut")),
      ),
    );
  }
}
