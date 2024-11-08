import 'package:flutter/material.dart';
import '../../../core/global_components/color_constants.dart';
import '../../../data/models/contact_model.dart';
import '../widgets/payment_header.dart';
import '../widgets/tab_filter.dart';
import '../widgets/contact_list.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = 0;
  final List<String> tabs = ["Dashboard", "Cards", "Analytics", "Recent"];
  int selectedFilter = 0;

  final List<ContactModel> recentContacts = [
    ContactModel(name: "Craig Workman", username: "@craigw"),
    ContactModel(name: "Emma Johnson", username: "@emmaj"),
    ContactModel(name: "Liam Smith", username: "@liams"),
  ];

  final List<ContactModel> contacts = [
    ContactModel(name: "Liam Smith", username: "@liams"),
    ContactModel(name: "Olivia Brown", username: "@oliviab"),
    ContactModel(name: "Noah Davis", username: "@noahd"),
    ContactModel(name: "Ava Wilson", username: "@avaw"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/qr_code');
        },
        icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
        label: const Text("Scan QR Code",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white)),
        backgroundColor: ColorConstants.primaryColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        elevation: 5.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Column(
          children: [
            PaymentHeader(
              selectedIndex: selectedIndex,
              tabs: tabs,
              onTabChanged: (index) => setState(() => selectedIndex = index),
            ),
            const SizedBox(height: 10),
            Container(
              color: ColorConstants.whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "Recent Send",
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search or add new",
                  hintStyle: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 16.0,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 0.0,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TabFilter(
                selectedFilter: selectedFilter,
                onFilterChanged: (index) =>
                    setState(() => selectedFilter = index),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  ContactList(sectionTitle: "Recent", contacts: recentContacts),
                  const SizedBox(height: 20),
                  ContactList(sectionTitle: "Contacts", contacts: contacts),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
