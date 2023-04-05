import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project_batch1/app/constants/colors.dart';
import 'package:flutter_demo_project_batch1/app/global_widgets/Reusable_widget.dart';
import 'package:flutter_demo_project_batch1/app/modules/SignUp/views/Sign_up.dart';
import 'package:flutter_demo_project_batch1/app/modules/signin/controllers/sign_controller.dart';
import 'package:flutter_demo_project_batch1/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SignIn extends GetView<SignInController> {
  SignIn({super.key});

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
                logoWidget("assets/signin_logo.png"),
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
                signInSignUpButton(
                    context,
                    true,
                    () => FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text)
                            .then((value) => Get.offNamed(Routes.dashboard))
                            .onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        })),
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
          onTap: () => Get.to(() => SignUp()),
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
