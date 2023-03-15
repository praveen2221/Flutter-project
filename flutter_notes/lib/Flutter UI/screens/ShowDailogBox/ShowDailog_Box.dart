import 'package:flutter/material.dart';

class ProgrammingLanguage {
  String name;
  double percent;

  ProgrammingLanguage(this.name, this.percent);
}

class MyShowDailogBox extends StatefulWidget {
  const MyShowDailogBox({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyShowDailogBoxState();
  }
}

class MyShowDailogBoxState extends State<MyShowDailogBox> {
  ProgrammingLanguage? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Flutter SimpleDialog Example")),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              ElevatedButton(
                child: const Text("Select a Language"),
                onPressed: () {
                  showMyAlertDialog(context);
                },
              ),
              const SizedBox(width: 5, height: 5),
              Text(
                  "Selected Language: ${selectedLanguage == null ? '?' : selectedLanguage!.name}")
            ])));
  }

  void showMyAlertDialog(BuildContext context) {
    var languages = [
      ProgrammingLanguage("Javascript", 67.7),
      ProgrammingLanguage("HTML/CSS", 63.1),
      ProgrammingLanguage("SQL", 57.4),
      ProgrammingLanguage("Python", 44.1),
      ProgrammingLanguage("Java", 40.2),
      ProgrammingLanguage("Bash/Shell/PowerShell", 33.1),
      ProgrammingLanguage("C#", 31.4),
      ProgrammingLanguage("PHP", 26.2),
      ProgrammingLanguage("Typescript", 25.4),
      ProgrammingLanguage("C++", 23.9),
      ProgrammingLanguage("C", 21.8),
      ProgrammingLanguage("Go", 8.8)
    ];

    // A List of SimpleDialogOption(s).
    var itemList = languages
        .map((lang) => SimpleDialogOption(
            onPressed: () {
              // Close and return value
              Navigator.pop(context, lang);
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(lang.name),
                  Text(lang.percent.toString(),
                      style: const TextStyle(color: Colors.red))
                ])))
        .toList();

    // Create SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: Row(
        children: const [
          Icon(Icons.code, color: Colors.blue),
          SizedBox(width: 5, height: 5),
          Text('Select a Language:'),
        ],
      ),
      titlePadding: EdgeInsets.fromLTRB(24, 24, 24, 10),
      titleTextStyle: TextStyle(color: Colors.red, fontSize: 24),
      backgroundColor: Colors.lightBlueAccent[100],
      elevation: 0,
      // shape: RoundedRectangleBorder(
      //     side: BorderSide(color: Colors.blueGrey, width: 3),
      //     borderRadius: BorderRadius.all(Radius.circular(15))),
      shape: BeveledRectangleBorder(
          side: BorderSide(color: Colors.blueGrey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      children: itemList,
    );

    // Call showDialog function to show dialog.
    Future futureValue = showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });

    futureValue.then((language) => {
          setState(() {
            selectedLanguage = language;
          })
        });
  }
}
