import 'package:flutter/material.dart';
import '../../../data/models/contact_model.dart';

class ContactList extends StatelessWidget {
  final String sectionTitle;
  final List<ContactModel> contacts;

  const ContactList({
    required this.sectionTitle,
    required this.contacts,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
        ...contacts.map((contact) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(contact.name[0], style: const TextStyle(color: Colors.white)),
            ),
            title: Text(
              contact.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(contact.username, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            onTap: () {
              // Define action on tap
            },
          );
        }).toList(),
      ],
    );
  }
}
