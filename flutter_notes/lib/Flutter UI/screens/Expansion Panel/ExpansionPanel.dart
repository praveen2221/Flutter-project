import 'package:flutter/material.dart';

class Step {
  Step(this.title, this.body, this.subtitle, [this.isExpanded = false]);
  String title;
  String body;
  String subtitle;
  bool isExpanded;
}

List<Step> getSteps() {
  return [
    Step(
      'Step 0: Install Flutter',
      'Install Flutter development tools according to the official documentation.',
      'Flutter',
    ),
    Step(
      'Step 1: Create a project',
      'Open your terminal, run `flutter create <project_name>` to create a new project.',
      'Flutter',
    ),
    Step(
      'Step 2: Run the app',
      'Change your terminal directory to the project directory, enter `flutter run`.',
      'Flutter',
    ),
  ];
}

class MyExpansionPanel extends StatefulWidget {
  const MyExpansionPanel({super.key});

  @override
  State<MyExpansionPanel> createState() => _MyExpansionPanelState();
}

class _MyExpansionPanelState extends State<MyExpansionPanel> {
  final List<Step> _steps = getSteps();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expansion Panel")),
      body: SingleChildScrollView(
          child: Container(
        child: expansionPanel(),
      )),
    );
  }

  ExpansionPanelList expansionPanel() {
    return ExpansionPanelList(
      animationDuration: Duration(seconds: 1),
      dividerColor: Colors.pink,
      elevation: 1,
      expandedHeaderPadding: EdgeInsets.all(8),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _steps[index].isExpanded = !isExpanded;
        });
      },
      children: _steps.map<ExpansionPanel>((Step step) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(step.title),
            );
          },
          body: ListTile(
            title: Text(step.body),
            subtitle: Text(step.subtitle),
          ),
          isExpanded: step.isExpanded,
        );
      }).toList(),
    );
  }
}
