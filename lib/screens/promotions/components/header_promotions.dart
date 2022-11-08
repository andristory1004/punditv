import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constrans.dart';

class HeaderPromotions extends StatelessWidget {
  const HeaderPromotions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Coin Balance',
                  style: TextStyle(color: kwhite, fontSize: 12),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                    'https://assets3.lottiefiles.com/temp/lf20_pO3t5Q.json',
                    width: 50),
                Text(
                  '200.000',
                  style: TextStyle(
                      color: kwhite, fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
