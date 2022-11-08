import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';

class CardSaldoNusapay extends StatelessWidget {
  final String saldo;
  final page;
  const CardSaldoNusapay({super.key, required this.saldo, required this.page});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NextScreen(context, page),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/monotone_money.png',
                  width: 16,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  saldo,
                  style: TextStyle(
                      color: kblack, fontSize: 12, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Image.asset(
                'assets/images/logo_nusapay.png',
                width: 71,
              ),
            )
          ],
        ),
      ),
    );
  }
}
