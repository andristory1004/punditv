import 'package:flutter/material.dart';

import '../../../utils/constrans.dart';
import '../../../widgets/custom_benefit_refferal.dart';

class BenefitRefferal extends StatelessWidget {
  const BenefitRefferal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kwhiteBg,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: kwhite,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  color: kblack.withOpacity(0.1))
            ]),
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Column(
          children: [
            Container(
              height: 54,
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              decoration: BoxDecoration(color: kwhiteBg, boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    color: kblack.withOpacity(0.1))
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Benefit',
                    style: TextStyle(
                        color: kblack,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CustomBenefitRefferal(
                images: 'assets/images/done.png',
                title: '1.000 Bonus Coin',
                description:
                    'You instantly receive your bonus as soon as your referral is active for the first time.'),
            CustomBenefitRefferal(
                images: 'assets/images/done.png',
                title: '10% Earning Referral',
                description:
                    'You earn 10% of the Credits your referrals earn.'),
            CustomBenefitRefferal(
                images: 'assets/images/done.png',
                title: 'Extra Exchange Earnings',
                description:
                    'You earn 5% extra when exchanging for every active referral you have.'),
            // CustomBenefitRefferal(
            //     images: 'assets/images/done.png',
            //     title: 'Win 50,000 Credits every month',
            //     description:
            //         'You automatically receive a free ticket in our monthly draw for every Active Referral you get.'),
            // CustomBenefitRefferal(
            //     images: 'assets/images/done.png',
            //     title: 'Fast Campaign Delivery',
            //     description:
            //         'With Active Referrals your Campaigns delivery speed is doubled - both for prioritized and non-prioritized Campaigns.')
          ],
        ),
      ),
    );
  }
}
