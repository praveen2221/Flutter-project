import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTextBox extends StatefulWidget {
  @override
  _MyTextBoxState createState() => _MyTextBoxState();
}

class _MyTextBoxState extends State<MyTextBox> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController editNameController = TextEditingController();
  TextEditingController EditContactController = TextEditingController();

  final CollectionReference Contacts =
      FirebaseFirestore.instance.collection('Contacts');

  int SelectedIndex = -1;
  String docID = "";

  Future<void> _saveIsID(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
  }

  Future<String> _getIsIId() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('id'));
    return prefs.getString('id') ?? "";
  }

  updateData(String docId) {
    late DocumentReference docRef =
        FirebaseFirestore.instance.collection('Contacts').doc(docId);
    docRef.update({
      'name': editNameController.text,
      'contact': EditContactController.text,
    }).then((value) {
      print('Document updated successfully!');
    }).catchError((error) {
      print('Error updating document: $error');
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: SingleChildScrollView(
              child: Column(
            children: [
              TextField(
                controller: editNameController,
                decoration: const InputDecoration(
                    hintText: "Contact Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ))),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: EditContactController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                    hintText: "Contact Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ))),
              ),
            ],
          )),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  if (editNameController.text.trim().isNotEmpty &&
                      EditContactController.text.trim().isNotEmpty) {
                    setState(() {
                      SelectedIndex = -1;
                    });
                  }

                  updateData(docID);
                  editNameController.clear();
                  EditContactController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text("Update"))
          ],
        );
      },
    );
  }

  Future<void> _addContact() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: SingleChildScrollView(
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
            ],
          )),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = "";
                          contactController.text = "";
                        });
                        FirebaseFirestore.instance.collection("Contacts").add({
                          "name": name,
                          "contact": contact,
                        });
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text("Save")),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contact List'),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: InkWell(
              onTap: () {
                _addContact();
              },
              child: Icon(
                Icons.person_add,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: Contacts.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // Retrieve the documents from the snapshot
                  List<DocumentSnapshot> docs = snapshot.data!.docs;

                  // Build the UI with the retrieved documents
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      String name = docs[index]['name'];
                      String contact = docs[index]['contact'];
                      print(docs.length);

                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: index % 2 == 0
                                  ? Colors.deepPurpleAccent
                                  : Colors.purple,
                              foregroundColor: Colors.white,
                              child: Text(name.length >= 2
                                  ? name.substring(0, 1)
                                  : '')),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(contact),
                              ]),
                          trailing: SizedBox(
                            width: 70,
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      _saveIsID(docs[index].id);
                                      _showMyDialog();
                                      editNameController.text = name;
                                      EditContactController.text = contact;
                                      setState(() {
                                        // SelectedIndex = index;
                                        docID = docs[index].id;
                                      });
                                    },
                                    child: const Icon(Icons.edit)),
                                const SizedBox(width: 10),
                                InkWell(
                                    onTap: () {
                                      // setState(() {
                                      //   contacts.removeAt(index);
                                      // });
                                      _getIsIId();
                                      FirebaseFirestore.instance
                                          .collection('Contacts')
                                          .doc(docs[index].id)
                                          .delete()
                                          .then((value) => print(
                                              "Data deleted successfully!"))
                                          .catchError((error) => print(
                                              "Failed to delete data: $error"));
                                    },
                                    child: const Icon(Icons.delete)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
