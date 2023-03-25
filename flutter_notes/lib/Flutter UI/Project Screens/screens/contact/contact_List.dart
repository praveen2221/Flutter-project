import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final List<Contact> contacts = [];

  Future<void> sendNameAndMobileNumber(String name, String mobileNumber) async {
    // Define the API endpoint URL
    final url = Uri.parse('http://demo4484894.mockable.io/ContactList');

    // Define the request body with the name and mobile number parameters
    final body = {'name': name, 'mobileNumber': mobileNumber};

    try {
      // Send a POST request to the API endpoint with the request body
      final response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        // The data was successfully sent to the server
        print('Data sent successfully');
        // Add the new contact to the list
        setState(() {
          contacts.add(Contact(name: name, phoneNumber: mobileNumber));
        });
      } else {
        // Handle the error response
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any network errors
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Enter name',
            ),
          ),
          TextField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              hintText: 'Enter phone number',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              sendNameAndMobileNumber(
                  nameController.text, phoneNumberController.text);
            },
            child: const Text('Save'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].phoneNumber),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
