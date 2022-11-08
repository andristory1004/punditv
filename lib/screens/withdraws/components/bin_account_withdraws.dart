import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';

import '../../payment_methods_withdraws/payment_method_witdraws.dart';

class BinAccountWithdraws extends StatelessWidget {
  const BinAccountWithdraws({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kwhite, width: 2))),
            child: Text(
              'Bin Your Account Nusapay',
              style: TextStyle(
                  color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () => NextScreen(context, const PaymentMethodWithdraws()),
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: double.infinity,
                height: 59,
                decoration: BoxDecoration(color: kpurpleSecond, boxShadow: [
                  BoxShadow(
                      color: kwhite.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 2))
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Bin Account',
                      style: TextStyle(color: korange, fontSize: 16),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: korange,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
