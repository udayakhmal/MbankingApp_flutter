import 'package:flutter/material.dart';
import '../../../core/global_components/color_constants.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/banner_savings.dart';
import '../widgets/recent_send_section.dart';
import '../widgets/current_activity_section.dart';
import '../widgets/fab_payment_button.dart';
import '../../../data/models/recent_send_model.dart';
import '../../../data/models/transaction_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  final List<String> tabs = ["Dashboard", "Cards", "Analytics", "Recent"];

  final recentSend = <RecentSendModel>[
    RecentSendModel(name: "Agnes", avatar: "https://i.pravatar.cc/150?img=1"),
    RecentSendModel(name: "Isyana", avatar: "https://i.pravatar.cc/150?img=2"),
    RecentSendModel(name: "Nurdin", avatar: "https://i.pravatar.cc/150?img=3"),
    RecentSendModel(name: "Budi", avatar: "https://i.pravatar.cc/150?img=4"),
    RecentSendModel(name: "Broto", avatar: "https://i.pravatar.cc/150?img=5"),
  ];

  final List<TransactionModel> transactions = [
    TransactionModel(
      name: "Davis Vetrov",
      date: "9:04am - Aug 5th 2023",
      amount: "+\$143.23",
      type: "in",
    ),
    TransactionModel(
      name: "Sarah Lee",
      date: "2:15pm - Sep 12th 2023",
      amount: "-\$921.21",
      type: "out",
    ),
    TransactionModel(
      name: "Michael Chen",
      date: "11:30am - Oct 3rd 2023",
      amount: "+\$250.00",
      type: "in",
    ),
    TransactionModel(
      name: "Linda Park",
      date: "4:45pm - Nov 20th 2023",
      amount: "-\$75.50",
      type: "out",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            DashboardHeader(
              selectedIndex: selectedIndex,
              onTabChanged: (index) => setState(() => selectedIndex = index),
              tabs: tabs,
            ),
            const BannerSavings(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    RecentSendSection(recentSend: recentSend),
                    const SizedBox(height: 20),
                    CurrentActivitySection(transactions: transactions),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FabPaymentButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
