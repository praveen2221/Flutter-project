import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project_batch1/app/modules/dashboard/dashboard_view.dart';
import 'package:flutter_demo_project_batch1/app/modules/signin/views/sign_in.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Widget authScreen() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return DashboardScreen();
        } else {
          return SignIn();
        }
      },
    );
  }
}
