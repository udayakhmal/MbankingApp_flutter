import 'package:flutter/material.dart';
import '../../../core/global_components/color_constants.dart';

class TabFilter extends StatelessWidget {
  final int selectedFilter;
  final ValueChanged<int> onFilterChanged;

  const TabFilter({
    required this.selectedFilter,
    required this.onFilterChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onFilterChanged(0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
            decoration: BoxDecoration(
              color: selectedFilter == 0 ? ColorConstants.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Center(
              child: Text(
                "All",
                style: TextStyle(
                  color: selectedFilter == 0 ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => onFilterChanged(1),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
            decoration: BoxDecoration(
              color: selectedFilter == 1 ? ColorConstants.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Center(
              child: Text(
                "Favorite",
                style: TextStyle(
                  color: selectedFilter == 1 ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
