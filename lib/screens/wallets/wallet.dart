import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:punditv/provider/sign_in_provider.dart';
import 'package:punditv/screens/home/profile.dart';
import 'package:punditv/screens/send_wallets/send_wallets.dart';
import 'package:punditv/screens/wallets/components/header_wallet.dart';
import 'package:punditv/screens/wallets/components/view_history_transaction_wallets.dart';
import 'package:punditv/utils/next_screen.dart';

import '../../utils/constrans.dart';
import 'components/recent_transaction.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: Image.asset('assets/images/punditv_logo.png'),
        actions: [
          IconButton(
              onPressed: () => NextScreen(context, const ProfileScreen()),
              icon: CircleAvatar(
                backgroundColor: kpurpleSecond,
                radius: 25,
                child: Icon(Icons.person),
              ))
        ],
      ),
      backgroundColor: kpurple,
      body: Container(
        child: Column(
          children: [
            HeaderWallets(),
            RecentTransaction(),
            Expanded(child: ViewHistoryTransactionWallets())
          ],
        ),
      ),
    );
  }
}
