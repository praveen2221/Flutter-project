// ignore: file_names
import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class MyTabBarButton1 extends StatefulWidget {
  const MyTabBarButton1({super.key, required String title});

  @override
  State<MyTabBarButton1> createState() => _MyTabBarButton1State();
}

class _MyTabBarButton1State extends State<MyTabBarButton1> {
  bool isChecked = true;

  final List<String> _checkboxList = ['Checkbox 1', 'Checkbox 2', 'Checkbox 3'];
  final List<bool> _checkboxValues = [false, false, false];

  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveState = <MaterialState>{
        MaterialState.selected,
        MaterialState.focused,
        MaterialState.pressed,
      };
      if (states.any(interactiveState.contains)) {
        return Colors.red;
      } else {
        return Colors.blue;
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                activeColor: Colors.blue,
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Column(
                children: _checkboxList.map((String text) {
                  int index = _checkboxList.indexOf(text);
                  return CheckboxListTile(
                    title: Text(text),
                    value: _checkboxValues[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _checkboxValues[index] = value!;
                      });
                    },
                  );
                }).toList(),
              ),

              //Radio button
              Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Lafayette'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Thomas Jefferson'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              ),

              //TextFormField
            ],
          ),
        ),
      ),
    );
  }
}
