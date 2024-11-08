import 'package:flutter/material.dart';
import '../../../core/global_components/color_constants.dart';
import '../../../data/models/transaction_model.dart';

class CurrentActivitySection extends StatelessWidget {
  final List<TransactionModel> transactions;

  const CurrentActivitySection({required this.transactions, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Current Activity",
            style: TextStyle(
              color: ColorConstants.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: transactions.map((transaction) {
              bool isIncome = transaction.type == "in";
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.name,
                            style: const TextStyle(
                              color: ColorConstants.blackColor,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            transaction.date,
                            style: const TextStyle(
                              color: ColorConstants.greyColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      transaction.amount,
                      style: TextStyle(
                        color: isIncome
                            ? ColorConstants.greenColor
                            : ColorConstants.redColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}