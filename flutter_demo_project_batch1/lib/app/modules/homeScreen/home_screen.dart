import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth Screen/auth_controller.dart';

class MyHomePage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _authController.authScreen(),
      ),
    );
  }
}
