import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_notes/APICalling/class/Category.dart';
import 'package:flutter_notes/Flutter%20UI/Project%20Screens/screens/contact/contact.dart';
import 'package:http/http.dart' as http;

class MyTextBox extends StatefulWidget {
  @override
  _MyTextBoxState createState() => _MyTextBoxState();
}

class _MyTextBoxState extends State<MyTextBox> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);

  int SelectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contact List'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "Contact Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contactController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                  hintText: "Contact Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ))),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = "";
                          contactController.text = "";
                          contacts.add(Contact(name: name, contact: contact));
                        });
                      }
                    },
                    child: Text("Save")),
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = "";
                          contactController.text = "";
                          contacts[SelectedIndex].name = name;
                          contacts[SelectedIndex].contact = contact;
                          SelectedIndex = -1;
                        });
                      }
                    },
                    child: Text("Update"))
              ],
            ),
            const SizedBox(height: 10),
            contacts.isEmpty
                ? const Text(
                    "No contact yet",
                    style: TextStyle(fontSize: 20),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: contacts.length,
                        itemBuilder: (context, index) => getrow(index)),
                  ),
          ],
        ),
      ),
    );
  }

  Widget getrow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor:
                index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
            foregroundColor: Colors.white,
            child: Text(contacts[index].name[0])),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            contacts[index].name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(contacts[index].contact),
        ]),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    nameController.text = contacts[index].name;
                    contactController.text = contacts[index].contact;
                    setState(() {
                      SelectedIndex = index;
                    });
                  },
                  child: Icon(Icons.edit)),
              SizedBox(width: 10),
              InkWell(
                  onTap: () {
                    setState(() {
                      contacts.removeAt(index);
                    });
                  },
                  child: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
