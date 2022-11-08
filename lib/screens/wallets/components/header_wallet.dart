import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/screens/buy_pundi_topup/buy_pundi.dart';
import 'package:punditv/screens/send_wallets/send_wallets.dart';
import 'package:punditv/screens/withdraws/withdraws.dart';

import '../../../utils/constrans.dart';
import '../../../utils/next_screen.dart';

class HeaderWallets extends StatelessWidget {
  const HeaderWallets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kpurple),
      child: Center(
        child: Column(
          children: [
            Text(
              'Total Coin Balance',
              style: TextStyle(color: kwhite, fontSize: 12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                    'https://assets3.lottiefiles.com/temp/lf20_pO3t5Q.json',
                    width: 50),
                Text(
                  '200.000 =',
                  style: TextStyle(
                      color: kwhite, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp. 50.000',
                  style: TextStyle(color: kwhite, fontSize: 12),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () =>
                          NextScreenReplacement(context, const BuyPundi()),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: kgrayNav,
                            child: Image.asset(
                              'assets/images/plus.png',
                              width: 25,
                              color: kwhite,
                            ),
                          ),
                          Text(
                            'Top Up',
                            style: TextStyle(
                                color: kwhite,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () => _sendWalletsPopup(context),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: kgrayNav,
                            child: Image.asset(
                              'assets/images/send.png',
                              width: 25,
                              color: kwhite,
                            ),
                          ),
                          Text(
                            'Send',
                            style: TextStyle(
                                color: kwhite,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () =>
                          NextScreenReplacement(context, const Withdraws()),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: kgrayNav,
                            child: Image.asset(
                              'assets/images/withdraw.png',
                              width: 25,
                              color: kwhite,
                            ),
                          ),
                          Text(
                            'Withdraw',
                            style: TextStyle(
                                color: kwhite,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _sendWalletsPopup(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: kwhite,
            elevation: 0,
            child: SendWallets(),
          );
        });
  }
}
