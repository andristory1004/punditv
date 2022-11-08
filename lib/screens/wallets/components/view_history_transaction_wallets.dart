import 'package:flutter/material.dart';
import 'package:punditv/models/history_transaction_wallets.dart';
import 'package:punditv/screens/wallets/components/item_history_wallet.dart';

class ViewHistoryTransactionWallets extends StatelessWidget {
  const ViewHistoryTransactionWallets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: historyTransactionWallets.length,
          itemBuilder: (context, index) {
            return ItemHistoryWallets(
                historyTransactionWallets: historyTransactionWallets[index]);
          }),
    );
  }
}
