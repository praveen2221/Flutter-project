import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Button _Widget/CustomButton.dart';
import '../../../Home/BottomNavigation2.dart';

class MySignUpScreen extends StatefulWidget {
  const MySignUpScreen({super.key});

  @override
  State<MySignUpScreen> createState() => _MySignUpScreenState();
}

class _MySignUpScreenState extends State<MySignUpScreen> {
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  bool _passwordVisibles = true;

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CustomButtomScreen()));
    } else {
      print('Form is invalid');
    }
  }

  String? validateEmail(String? value) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value) ||
            !value.contains("@gmail.com")
        ? 'Enter a valid email address'
        : null;
  }

  String? passwordValidator(String? value) {
    final validCharacters =
        RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[a-zA-Z\d@$!%*?&]+$');
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    } else if (value.length < 8) {
      return 'Minimum Password length is 8';
    } else if (!validCharacters.hasMatch(value)) {
      print(value);
      return 'Atleast one alphabet, number and special characters are needed.';
    }
    return null;
  }

  String? confirmPasswordValidator(String? values) {
    setState(() {});
    final validCharacter =
        RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[a-zA-Z\d@$!%*?&]+$');

    if (values == null || values.isEmpty) {
      return 'Field cannot be empty';
    } else if (textEditingController.text != values) {
      print(values);
      return "password not matching $values";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            newMethod(),
          ]),
        ),
      ),
    );
  }

  Form newMethod() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              "Create an Account",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Email"),
            const SizedBox(height: 10),
            // input field for email
            TextFormField(
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),

              validator: (value) => validateEmail(value),
              // onSaved: (value) => _email = value,
            ),
            const SizedBox(height: 10),
            const Text("Password"),
            const SizedBox(height: 10),
            // input field for password
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              obscureText: _passwordVisible,
              controller: textEditingController,
              validator: (value) => passwordValidator(value),
              // onSaved: (value) => _password = value,
            ),
            const SizedBox(height: 10),
            const Text("Confirm Password"),

            const SizedBox(height: 10),

            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisibles
                        ? Icons.visibility_sharp
                        : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisibles = !_passwordVisibles;
                    });
                  },
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              obscureText: _passwordVisibles,
              validator: (value) => confirmPasswordValidator(value),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                text: "Submit >",
                onPressed: validateAndSave,
                color: Colors.black,
                buttonwidth: double.infinity,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: RichText(
                text: const TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 98, 236, 183), fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign in',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),