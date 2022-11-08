import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/utils/constrans.dart';

class HeaderEarnCoins extends StatelessWidget {
  const HeaderEarnCoins({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 24.0),
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: 170,
        decoration: BoxDecoration(
            color: kpurple, borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Credits Pundi Ballance',
              style: TextStyle(
                  color: kwhite, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Lottie.network(
                        'https://assets3.lottiefiles.com/temp/lf20_pO3t5Q.json',
                        width: 70),
                    Text(
                      '200.000',
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/icons/icon_pundi.png',
                  width: 54,
                )
              ],
            ),
            Text(
              overflow: TextOverflow.fade,
              'Get more credit pundi on Pundi TV coffers and exchange your credit pundi into wallet balance, then withdraw your wallet balance via Nusapay',
              style: TextStyle(color: kwhite, fontSize: 12),
            )
          ],
        ));
  }
}
