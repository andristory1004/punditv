import 'package:flutter/material.dart';
import 'package:punditv/models/history_transaction_wallets.dart';

import '../../../utils/constrans.dart';

class ItemHistoryWallets extends StatelessWidget {
  final HistoryTransactionWallets historyTransactionWallets;
  const ItemHistoryWallets(
      {super.key, required this.historyTransactionWallets});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kwhiteBg),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 24.0),
        child: Container(
          width: 364,
          height: 70,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: kblack.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 2))
          ], color: kwhite, borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Image.asset(
                  historyTransactionWallets.icons,
                  width: 17,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    historyTransactionWallets.title,
                    style: TextStyle(color: kpurple, fontSize: 16),
                  ),
                  Text(
                    historyTransactionWallets.date,
                    style: TextStyle(color: kblue, fontSize: 14),
                  ),
                  Text(
                    historyTransactionWallets.duration,
                    style: TextStyle(color: kgrayText, fontSize: 12),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  historyTransactionWallets.total,
                  style: TextStyle(
                      color: kpurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
