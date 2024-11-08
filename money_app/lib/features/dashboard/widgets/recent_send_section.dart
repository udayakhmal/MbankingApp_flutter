import 'package:flutter/material.dart';
import '../../../core/global_components/color_constants.dart';
import '../../../data/models/recent_send_model.dart';

class RecentSendSection extends StatelessWidget {
  final List<RecentSendModel> recentSend;

  const RecentSendSection({required this.recentSend, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Recent Send",
            style: TextStyle(
              color: ColorConstants.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentSend.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(recentSend[index].avatar),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        recentSend[index].name,
                        style: const TextStyle(
                          color: ColorConstants.blackColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
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
