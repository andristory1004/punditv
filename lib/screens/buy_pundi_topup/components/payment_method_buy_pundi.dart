import 'package:flutter/material.dart';
import 'package:punditv/utils/next_screen.dart';

import '../../../utils/constrans.dart';
import '../../topup_payment_method/topup_payment_method.dart';

class PaymentMethodsBuyPundi extends StatelessWidget {
  const PaymentMethodsBuyPundi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 5.0),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kwhite, width: 1))),
            child: Text(
              'Payment Mehtod',
              style: TextStyle(
                  color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: 364,
            height: 59,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0XFF232342),
                boxShadow: [
                  BoxShadow(
                      color: kwhite.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 1))
                ]),
            child: InkWell(
              onTap: () => NextScreen(context, const TopUpPaymentMethodPundi()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Chose Payment Methode',
                    style: TextStyle(
                      fontSize: 16,
                      color: korange,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: korange,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
