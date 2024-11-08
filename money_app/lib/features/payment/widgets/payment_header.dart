import 'package:flutter/material.dart';
import '../../../core/global_components/color_constants.dart';

class PaymentHeader extends StatelessWidget {
  final int selectedIndex;
  final List<String> tabs;
  final ValueChanged<int> onTabChanged;

  const PaymentHeader({
    required this.selectedIndex,
    required this.tabs,
    required this.onTabChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      color: ColorConstants.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage("https://i.pravatar.cc/150?img=12"),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Good Morning,",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text("Asal Design 👋",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => onTabChanged(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: isSelected
                            ? Colors.white
                            : ColorConstants.primaryColor,
                        width: 1.5,
                      ),
                      color: isSelected ? Colors.white : Colors.transparent,
                    ),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
