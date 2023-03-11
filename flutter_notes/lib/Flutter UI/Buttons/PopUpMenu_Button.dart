// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_notes/Flutter%20UI/Buttons/Elevated_Button.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class MyPopUpMenuButtons extends StatefulWidget {
  const MyPopUpMenuButtons({super.key, required String title});

  @override
  State<MyPopUpMenuButtons> createState() => _MyPopUpMenuButtonsState();
}

class _MyPopUpMenuButtonsState extends State<MyPopUpMenuButtons> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PopUpMenu Button"),
        actions: [
          PopupMenuButton<SampleItem>(
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (SampleItem item) {
              setState(() {
                selectedMenu = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              PopupMenuItem<SampleItem>(
                value: SampleItem.itemOne,
                child: InkWell(onTap: () {}, child: Text('Item 1')),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemTwo,
                child: Text('Item 2'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemThree,
                child: Text('Item 3'),
              ),
            ],
          ),
        ],
      ),
      body: const SingleChildScrollView(),
    );
  }
}
