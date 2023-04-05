import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project_batch1/app/constants/colors.dart';
import 'package:flutter_demo_project_batch1/app/global_widgets/Reusable_widget.dart';
import 'package:flutter_demo_project_batch1/app/modules/SignUp/Controller/signup_controller.dart';
import 'package:flutter_demo_project_batch1/app/modules/dashboard/dashboard_view.dart';
import 'package:flutter_demo_project_batch1/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SignUp extends GetView<SignUpController> {
  SignUp({super.key});

  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailTextController = TextEditingController();

  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Sign up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2893"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(children: [
              const SizedBox(height: 20),
              reusableTextField(
                myController: _nameController,
                text: "Enter Username",
                icon: Icons.person_outline,
                isPassword: false,
              ),
              reusableTextField(
                myController: _emailTextController,
                text: "Email Address",
                icon: Icons.person_outline,
                isPassword: false,
              ),
              reusableTextField(
                myController: _passwordTextController,
                text: "Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              signInSignUpButton(
                context,
                false,
                () => FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) => Get.offNamed(Routes.dashboard))
                    .onError((error, stackTrace) {
                  print("Error${error.toString()}");
                }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
