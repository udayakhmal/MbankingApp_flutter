import 'package:flutter/material.dart';
import '../../../core/global_components/color_constants.dart';

class BannerSavings extends StatelessWidget {
  const BannerSavings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            decoration: BoxDecoration(
              color: ColorConstants.bannerColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                Icon(Icons.emoji_events, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "You have saved \$10 in the last 30 days 🎉",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
