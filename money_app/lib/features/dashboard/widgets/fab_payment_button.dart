import 'package:flutter/material.dart';
import '../../../core/global_components/color_constants.dart';

class FabPaymentButton extends StatelessWidget {
  const FabPaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushNamed(context, '/payment');
      },
      icon: const Icon(Icons.qr_code_scanner_sharp, color: Colors.white),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text("New Payment", style: TextStyle(fontSize: 14, color: Colors.white)),
          SizedBox(width: 8),
          Icon(Icons.add, color: Colors.white),
        ],
      ),
      backgroundColor: ColorConstants.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 5.0,
    );
  }
}
