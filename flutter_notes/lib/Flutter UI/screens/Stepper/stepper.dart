import 'package:flutter/material.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({super.key});

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stepper(
          currentStep: _currentStep,
          onStepTapped: (index) {
            setState(() {
              _currentStep = index;
            });
          },
          onStepContinue: () {
            setState(() {
              if (_currentStep < 2) _currentStep++;
            });
          },
          onStepCancel: () {
            setState(() {
              if (_currentStep > 0) _currentStep--;
            });
          },
          steps: [
            Step(
              title: const Text('Step 1'),
              content: const Text('Do something in step 1'),
              subtitle: Text("Praveen A"),
              isActive: _currentStep == 0,
            ),
            Step(
              title: const Text('Step 2'),
              content: const Text('Do something in step 2'),
              isActive: _currentStep == 1,
            ),
            Step(
              title: const Text('Step 3'),
              content: const Text('Do something in step 3'),
              isActive: _currentStep == 2,
            ),
          ],
        ),
      ),
    );
  }
}
