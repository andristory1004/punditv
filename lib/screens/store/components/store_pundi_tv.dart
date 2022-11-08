import 'package:flutter/material.dart';
import 'package:punditv/screens/buy_pundi_topup/buy_pundi.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/screens/wallets/wallet.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_store.dart';

import '../../../utils/constrans.dart';
import '../../coming_soon/coming_soon.dart';

class PundiTvStore extends StatelessWidget {
  const PundiTvStore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kwhiteBg,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Text(
                  'Pundi TV Store',
                  style: TextStyle(
                      color: kpurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomStore(
                images: 'assets/images/coin_second.png',
                title: 'Buy kredit Pundi',
                description: ' Top Up coint in your account \nis instantly',
                ontap: () => NextScreen(context, const BuyPundi()),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomStore(
                images: 'assets/images/member.png',
                title: 'Buy Membership',
                description:
                    ' Get more of everything --- Faster, \nbetter and cheaper',
                ontap: () => _showComingSoon(context)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomStore(
                images: 'assets/images/store_pundi.png',
                title: 'Sale your point credits',
                description: ' offer your price and get Pundi Credits',
                ontap: () => NextScreen(context, const NavigationScreen())),
          ),
        ],
      ),
    );
  }

  _showComingSoon(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            elevation: 0,
            child: ComingSoon(),
          );
        });
  }
}
