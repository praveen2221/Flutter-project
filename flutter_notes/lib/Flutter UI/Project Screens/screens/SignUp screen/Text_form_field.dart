import 'package:flutter/material.dart';

import 'Signup_screen.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({super.key});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  TextEditingController textEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
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

  String? passwordValidator(String? text) {
    print(text);
    final validCharacters =
        RegExp(r'^(?=.[a-zA-Z])(?=.?[0-9])(?=.?[!@#\$&~]).{8,}$');
    if (text == null || text.isEmpty) {
      return 'Field cannot be empty';
    } else if (text.length < 8) {
      return 'Minimum Password length is 8';
    } else if (validCharacters.hasMatch(text)) {
      print(validCharacters.hasMatch(text));
      return 'Atleast one alphabet, number and special characters are needed.';
    }
    return null;
  }

  void _InputText() {
    setState(() {});
    if (textEditingController.text != null &&
        textEditingController.text.contains('@')) {
      print('Do not use the @ char.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // input field for email
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) => validateEmail(value),
                  // onSaved: (value) => _email = value,
                ),
                // input field for password
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) => passwordValidator(value),
                  // onSaved: (value) => _password = value,
                ),
                ElevatedButton(
                  onPressed: validateAndSave,
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MySignUpScreen()));
                    },
                    child: RichText(
                      text: const TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 98, 236, 183),
                              fontSize: 15),
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
                  ),
                )
              ],
            ),
          ),
        ),
        // child: Center(
        //   child: Column(
        //     children: [
        //       TextFormField(
        //         controller: textEditingController,
        //         decoration: const InputDecoration(
        //           icon: Icon(Icons.person),
        //           hintText: 'What do people call you?',
        //           labelText: 'Name *',
        //         ),
        //         onSaved: (String? value) {
        //           // This optional block of code can be used to run
        //           // code when the user saves the form.
        //         },
        //         validator: (String? value) {
        //           setState(() {
        //             if (value != null && value.contains('@')) {
        //               print('Do not use the @ char.');
        //             }
        //           });
        //           // return (value != null && value.contains('@'))
        //           //     ? 'Do not use the @ char.'
        //           //     : null;
        //         },
        //       ),
        //       TextButton(onPressed: _InputText, child: const Text("Data")),
        //       Text(textEditingController.text),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
