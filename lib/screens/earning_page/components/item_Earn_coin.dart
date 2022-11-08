import 'package:flutter/material.dart';
import 'package:punditv/screens/promotions/promotions.dart';
import 'package:punditv/screens/refferal/refferal.dart';
import 'package:punditv/screens/earning_page/youtube_subscribes.dart';
import 'package:punditv/screens/earning_page/youtube_views.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_earn.dart';

import '../../../utils/constrans.dart';

class ItemEarnCoins extends StatelessWidget {
  const ItemEarnCoins({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 54.0, top: 24.0),
      decoration: BoxDecoration(color: kwhiteBg),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Earn Pundi',
                  style: TextStyle(
                      color: kpurple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          CustomEarns(
              coins: '120 Coin/View hour',
              images: 'assets/images/youtube.png',
              title: 'Youtube View',
              description: 'View other users chanel \nand earn Coin',
              ontap: () => NextScreen(context, const YoutubeViews())),
          CustomEarns(
              coins: '120 Coin/Subscription',
              images: 'assets/images/subscribe.png',
              title: 'Youtube Subscribe',
              description: 'Subscribe to other users chanel\nand earn Coin',
              ontap: () => NextScreen(context, const YoutubeSubscribes())),
          CustomEarns(
              coins: '120 Coin/View hour',
              images: 'assets/images/people.png',
              title: 'Referral',
              description: 'View other users chanel\nand earn Coin',
              ontap: () => NextScreen(context, const RefferalScreen())),
          CustomEarns(
              coins: '60 Coin/Promotion',
              images: 'assets/images/promotion.png',
              title: 'Promotion',
              description:
                  'Earn additional coin by completing\nour current promotion',
              ontap: () => NextScreen(context, const PromotionScreen())),
        ],
      ),
    );
  }
}
