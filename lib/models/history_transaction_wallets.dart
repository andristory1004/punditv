import 'package:flutter/material.dart';

class HistoryTransactionWallets {
  final int id;
  final String icons, title, date, duration, total;
  HistoryTransactionWallets(
      this.id, this.icons, this.title, this.date, this.duration, this.total);
}

final List<HistoryTransactionWallets> historyTransactionWallets = [
  HistoryTransactionWallets(1, 'assets/images/download.png', 'Top up by MM',
      '2nd/06/2020', '12:00pm', '+ 370,000'),
  HistoryTransactionWallets(1, 'assets/images/download.png', 'Top up by MM',
      '2nd/06/2020', '12:00pm', '+ 370,000'),
  HistoryTransactionWallets(1, 'assets/images/download.png', 'Top up by MM',
      '2nd/06/2020', '12:00pm', '+ 370,000'),
  HistoryTransactionWallets(1, 'assets/images/download.png', 'Top up by MM',
      '2nd/06/2020', '12:00pm', '+ 370,000'),
  HistoryTransactionWallets(1, 'assets/images/download.png', 'Top up by MM',
      '2nd/06/2020', '12:00pm', '+ 370,000'),
  HistoryTransactionWallets(1, 'assets/images/download.png', 'Top up by MM',
      '2nd/06/2020', '12:00pm', '+ 370,000'),
  HistoryTransactionWallets(1, 'assets/images/download.png', 'Top up by MM',
      '2nd/06/2020', '12:00pm', '+ 370,000'),
  HistoryTransactionWallets(1, 'assets/images/download.png', 'Top up by MM',
      '2nd/06/2020', '12:00pm', '+ 370,000'),
];
